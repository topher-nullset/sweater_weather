require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe '#fetch_forecast' do
    it 'returns weather data for a given location', :vcr do
      coordinates = {"lat"=>61.21753,"lng"=>-149.85815}
      response = WeatherService.new.fetch_forecast(coordinates)

      expect(response).to_not be_nil
      expect(response['location']).to be_a(Hash)
      expect(response['location']['name']).to eq('Anchorage')

      expect(response['current']).to be_a(Hash)
      expect(response['current']['temp_f']).to be_a(Float)

      expect(response['forecast']).to be_a(Hash)
      expect(response['forecast']['forecastday']).to be_a(Array)
    end
  end

  describe '#get_weather_eta' do
    it 'returns weather data for a given location and hour', :vcr do
      params = {"lat"=>61.21753,"lng"=>-149.85815, 'hour'=> 12}
      response = WeatherService.new.get_weather_eta(params)
      
      expect(response).to_not be_nil
      expect(response['location']).to be_a(Hash)
      expect(response['location']['name']).to eq('Anchorage')
      expect(response['location']['region']).to eq('Alaska')
      expect(response['forecast']['forecastday']).to be_a(Array)

      hour = response['forecast']['forecastday'][0]['hour'][0]
      expect(hour['time']).to be_a(String)
      expect(hour['temp_f']).to be_a(Float)
      expect(hour['condition']['text']).to be_a(String)
    end
  end
end