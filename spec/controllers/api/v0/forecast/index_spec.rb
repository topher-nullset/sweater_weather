require 'rails_helper'

RSpec.describe Api::V0::ForecastController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response with the correct JSON format', :vcr do
      get :index, params: { location: 'anchorage,ak' }
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)

      expect(json_response).to have_key('data')
      data = json_response['data']
      expect(data).to have_key('id')
      expect(data).to have_key('type')
      expect(data).to have_key('attributes')

      current_weather = data['attributes']['current_weather']
      expect(current_weather).to have_key('last_updated')
      expect(current_weather).to have_key('temperature')

      daily_weather = data['attributes']['daily_weather']
      expect(daily_weather).to be_an(Array)
      expect(daily_weather.first).to have_key('date')
      expect(daily_weather.first).to have_key('sunrise')

      hourly_weather = data['attributes']['hourly_weather']
      expect(hourly_weather).to be_an(Array)
      expect(hourly_weather.first).to have_key('time')
      expect(hourly_weather.first).to have_key('temperature')

    end
  end
end  
