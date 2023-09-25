class RoadTripFacade
  def self.create_road_trip(params)
    trip_data = MapquestService.new.get_roadtrip(params)

    if trip_data['info']['statuscode'] == 402
      return {
        data: {
          id: nil,
          type: 'road_trip',
          attributes: {
            start_city: params[:origin],
            end_city: params[:destination],
            travel_time: 'impossible',
            weather_at_eta: {}
          }
        }
      }
    end

    trip_time = trip_data['route']['formattedTime']
    coordinates = trip_data['route']['legs'][0]['maneuvers'].last['startPoint']
    eta = trip_data['route']['realTime']/3600

    if eta <= 23
      weather_data = WeatherService.new.fetch_forecast(coordinates)
      weather = weather_data['forecast']['forecastday'][0]['hour'][eta]
    else
      days = (eta/24).floor
      hour = (eta - days*24.00).floor
      coordinates.store('hour', hour)
      coordinates.store('days', days + 1)
      weather_data = WeatherService.new.get_weather_eta(coordinates)
      weather = weather_data['forecast']['forecastday'][days]['hour'][0]
    end


    {
      data: {
        id: nil,
        type: 'road_trip',
        attributes: {
          start_city: params[:origin],
          end_city: params[:destination],
          travel_time: trip_time,
          weather_at_eta: {
              datetime: weather['time'],
              temperature: weather['temp_f'],
              condition: weather['condition']['text']
          }
        }
      }
    }
  end
end