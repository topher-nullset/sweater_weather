class WeatherService
  BASE_URL = 'http://api.weatherapi.com/v1/forecast.json'.freeze

  def initialize
    @conn = Faraday.new(url: BASE_URL) do |faraday|
      faraday.use Faraday::Request::UrlEncoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_weather_eta(params)
    response = @conn.get do |req|
      req.params['key'] = weather_api_key
      req.params['q'] = "#{params['lat']},#{params['lng']}"
      req.params['days'] = params['days']
      req.params['hour'] = params['hour']
    end

    handle_response(response)
  end

  def fetch_forecast(params)
    response = @conn.get do |req|
      req.params['key'] = weather_api_key
      req.params['q'] = "#{params['lat']},#{params['lng']}"
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
      JSON.parse(response.body)
    end
  end
end