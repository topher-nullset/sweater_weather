require 'rails_helper'

RSpec.describe Api::V0::UsersController, type: :controller do
  describe 'POST #create' do
    it 'creates a new user', :vcr do
      post :create, params: { email: 'chris@cullinane.com',
                              password: 'hearmeroar',
                              password_confirmation: 'hearmeroar' }
      
      expect(response).to have_http_status(:created)
      parsed = JSON.parse(response.body)

      expect(parsed['data']).to be_a(Hash)
      expect(parsed['data']['type']).to eq("users")
      expect(parsed['data']['id']).to be_a(Integer)
      expect(parsed['data']['attributes']).to be_a(Hash)
      expect(parsed['data']['attributes']['email']).to eq('chris@cullinane.com')
      expect(parsed['data']['attributes']['api_key']).to be_a(String)
    end

    it 'fails to create a new user with an invalid email', :vcr do
      post :create, params: { email: '',
                              password: 'hearmeroar',
                              password_confirmation: 'hearmeroar' }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end