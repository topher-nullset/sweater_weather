class MapquestService
  BASE_URL = 'https://www.mapquestapi.com'.freeze

  def initialize
    @conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.use Faraday::Request::UrlEncoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_coordinates(location)
    response = @conn.get do |req|
      req.url '/geocoding/v1/address'
      req.params['location'] = location
      req.params['key'] = Rails.application.credentials.mapquest[:api_key]
    end
    parsed = JSON.parse(response.body)
  end

  def get_roadtrip(params)
    response = @conn.get do |req|
      req.url '/directions/v2/route'
      req.params['from'] = params[:origin]
      req.params['to'] = params[:destination]
      req.params['key'] = Rails.application.credentials.mapquest[:api_key]
    end
    parsed = JSON.parse(response.body)
  end
end