require 'rails_helper'

RSpec.describe MapquestService, type: :service do
  describe '#get_coordinates' do
    it 'returns coordinates for a given location', :vcr do
      location = 'denver,co'
      
      response = MapquestService.new.get_coordinates(location)

      expect(response).to be_a(Hash)
      expect(response['results']).to be_an(Array)
      expect(response['results'].first['locations']).to be_an(Array)
      expect(response['results'].first['locations'].first['latLng']).to be_a(Hash)
      expect(response['results'].first['locations'].first['latLng']['lat']).to be_a(Float)
      expect(response['results'].first['locations'].first['latLng']['lng']).to be_a(Float)
    end
  end

  describe '#get_roadtrip' do
    it 'returns road trip information for a given origin and destination', :vcr do
      response = MapquestService.new.get_roadtrip({origin: 'denver,co', destination: 'pueblo,co'})
      
      expect(response).to be_a(Hash)
      expect(response['route']['realTime']).to be_an(Integer)
      expect(response['route']['time']).to be_an(Integer)
      expect(response['route']['formattedTime']).to be_an(String)
    end
  end
end