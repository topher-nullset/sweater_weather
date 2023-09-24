require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should have_secure_password }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation).on(:create) }
  end

  describe 'model methods' do
    it '#generate_api_key can generate an api key' do
      user = User.create!(email: 'chris@cullinane.com', password: 'secret', password_confirmation: 'secret')

      expect(user.api_key).to be_a(String)
    end
  end
end