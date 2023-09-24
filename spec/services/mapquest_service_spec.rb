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
end