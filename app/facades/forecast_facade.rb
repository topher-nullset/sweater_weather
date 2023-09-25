class ForecastFacade
  def self.get_forecast(location)
    response = MapquestService.new.get_coordinates(location)
    coordinates = response['results'][0]['locations'][0]['latLng']
    forecast_data = WeatherService.new.fetch_forecast(coordinates)
    
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: format_current_weather(forecast_data['current']),
          daily_weather: format_daily_weather(forecast_data['forecast']),
          hourly_weather: format_hourly_weather(forecast_data['forecast'])
        }
      }
    }
  end

  private

  def self.format_current_weather(weather_data)
    {
      last_updated: weather_data['last_updated'],
      temperature: weather_data['temp_f'],
      feels_like: weather_data['feelslike_f'],
      humidity: weather_data['humidity'],
      uvi: weather_data['uv'],
      visibility: weather_data['vis_miles'],
      condition: weather_data['condition']['text'],
      icon: weather_data['condition']['icon']
    }
  end

  def self.format_daily_weather(weather_data)
    weather_data['forecastday'].map do |day_data|
      {
        date: day_data['date'],
        sunrise: day_data['astro']['sunrise'],
        sunset: day_data['astro']['sunset'],
        max_temp: day_data['day']['maxtemp_f'],
        min_temp: day_data['day']['mintemp_f'],
        condition: day_data['day']['condition']['text'],
        icon: day_data['day']['condition']['icon']
      }
    end
  end

  def self.format_hourly_weather(daily_weather_data)
    daily_weather_data['forecastday'].first['hour'].map do |hour_data|
      {
        time: hour_data['time'],
        temperature: hour_data['temp_f'],
        conditions: hour_data['condition']['text'],
        icon: hour_data['condition']['icon']
      }
    end
  end
end
