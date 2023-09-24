class MapquestService
  BASE_URL = 'https://www.mapquestapi.com/geocoding/v1/address'.freeze

  def initialize
    @conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.use Faraday::Request::UrlEncoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_coordinates(location)
    response = @conn.get do |req|
      req.params['location'] = location
      req.params['key'] = Rails.application.credentials.mapquest[:api_key]
    end

    parsed = JSON.parse(response.body)
  end
end