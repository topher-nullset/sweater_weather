require 'rails_helper'

RSpec.describe Api::V1::BookSearchController, type: :controller do
  describe 'GET #index' do
    it 'should return city, weather, book count and books', :vcr do
      get :index, params: { location: 'Denver,CO', quantity: 5}

      expect(response).to have_http_status(:success)
      parsed = JSON.parse(response.body)

      expect(parsed['data']).to be_a(Hash)
      data = parsed['data']
      expect(data['id']).to be(nil)
      expect(data['type']).to eq('books')
      expect(data['attributes']).to be_a(Hash)

      attributes = data['attributes']
      expect(attributes['destination']).to eq('Denver')
      expect(attributes['forecast']).to be_a(Hash)
      expect(attributes['forecast']['summary']).to be_a(String)
      expect(attributes['forecast']['temperature']).to be_a(String)
      expect(attributes['total_books_found']).to be_a(Integer)

      expect(attributes['books']).to be_an(Array)
      expect(attributes['books'].count).to eq(5)
      expect(attributes['books'].first).to be_a(Hash)
      expect(attributes['books'].first['title']).to be_a(String)
      expect(attributes['books'].first['isbn']).to be_a(Array)
      expect(attributes['books'].first['isbn'].first).to be_a(String)
    end

    it 'fails with bad params', :vcr do
      get :index, params: { location: 'Anchorage,AK', quantity: 5.33 }
      expect(response).to have_http_status(:bad_request)

      parsed = JSON.parse(response.body)
      expect(parsed['error']).to eq('Quantity must be a positive integer greater than 0')

      get :index, params: { location: 'Anchorage,AK', quantity: -5 }, format: :json
      expect(response).to have_http_status(:bad_request)

      parsed = JSON.parse(response.body)
      expect(parsed['error']).to eq('Quantity must be a positive integer greater than 0')
    end
  end
end