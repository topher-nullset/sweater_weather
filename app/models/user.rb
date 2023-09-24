class User < ApplicationRecord
  has_many :sessions
  has_secure_password

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true
  validates :password_confirmation, presence: true, on: :create

  before_create :generate_api_key

  def generate_api_key
    # lol hex16 and i added a a check to see if its already been generated
    loop do
      new_api_key = SecureRandom.hex(16)
      unless User.exists?(api_key: new_api_key)
        self.api_key = new_api_key
        break
      end
    end
  end
end
