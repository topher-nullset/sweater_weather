require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe '#get_weather' do
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
end