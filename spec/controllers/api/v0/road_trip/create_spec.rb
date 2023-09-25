require 'rails_helper'

RSpec.describe Api::V0::RoadTripController, type: :controller do
  describe 'POST #create' do
    before do
      @user = User.create(email: 'Ian@isawesome.com', password: 'here', password_confirmation: 'here')
      @session = Session.create(user: @user)
      @api_key = @user.api_key
    end

    it 'returns a successful response', :vcr do
      payload = { 
        origin: 'Anchorage, AK', 
        destination: 'Fairbanks, AK', 
        api_key: @api_key
      }
      
      post :create, params: payload, format: :json
      expect(response).to have_http_status(:success)
      parsed = JSON.parse(response.body)
      expect(parsed).to be_a Hash
      expect(parsed).to have_key('data')

      data = parsed['data']
      expect(data).to be_a Hash
      expect(data).to have_key('id')
      expect(data['id']).to eq(nil)
      expect(data).to have_key('type')
      expect(data['type']).to eq('road_trip')
      expect(data).to have_key('attributes')

      attributes = data['attributes']
      expect(attributes).to be_a Hash
      expect(attributes).to have_key('start_city')
      expect(attributes['start_city']).to eq('Anchorage, AK')
      expect(attributes).to have_key('end_city')
      expect(attributes['end_city']).to eq('Fairbanks, AK')
      expect(attributes['travel_time']).to be_a(String)
      expect(attributes['weather_at_eta']).to be_a(Hash)

      weather = attributes['weather_at_eta']
      expect(weather).to be_a Hash
      expect(weather).to have_key('datetime')
      expect(weather['datetime']).to be_a(String)
      expect(weather).to have_key('temperature')
      expect(weather['temperature']).to be_a(Float)
      expect(weather).to have_key('condition')
      expect(weather['condition']).to be_a(String)
    end
  end
end