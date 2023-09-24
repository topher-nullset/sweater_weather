class WeatherService
  BASE_URL = 'http://api.weatherapi.com/v1/forecast.json'.freeze

  def initialize
    @conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.use Faraday::Request::UrlEncoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_forecast(coordinates)
    response = @conn.get do |req|
      req.params['key'] = weather_api_key
      req.params['q'] = "#{coordinates['lat']},#{coordinates['lng']}"
      req.params['days'] = 5
    end

    handle_response(response)
  end

  private

  def weather_api_key
    Rails.application.credentials.weather[:api_key]
  end

  def handle_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      # Handle error response as needed
      nil
    end
  end
end