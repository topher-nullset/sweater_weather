require 'rails_helper'

RSpec.describe Api::V0::SessionsController, type: :controller do
  describe 'POST #create' do
    before do
      @user = User.create!(email: 'ethan@isthebest.com', password: 'Connor&Mike', password_confirmation: 'Connor&Mike')
      @key = @user.api_key
    end

    it 'creates a new user session' do
      post :create, params: { email: 'ethan@isthebest.com', password: 'Connor&Mike' }
      expect(response).to have_http_status(:success)

      parsed = JSON.parse(response.body)
      expect(parsed['data']['type']).to eq('users')

      attributes = parsed['data']['attributes']
      expect(attributes['email']).to eq(@user.email)
      expect(attributes['api_key']).to eq(@key)
    end

    it 'fails to create a new user session with invalid credentials' do
      post :create, params: { email: 'ethan@isthebest.com', password: 'wrong' }
      expect(response).to have_http_status(:unauthorized)

      parsed = JSON.parse(response.body)
      expect(parsed['errors']).to eq('Invalid email or password')
    end
  end
end