class BookSearchFacade
  def self.book_search(location, quantity)
    # Fetch the coordinates for the destination city
    coord_request = MapquestService.new.get_coordinates(location)
    coordinates = coord_request['results'][0]['locations'][0]['latLng']

    # Fetch the weather forecast for the destination city
    weather_request = WeatherService.new.fetch_forecast(coordinates)
    local = weather_request['location']['name'].downcase

    # Fetch books related to the destination city
    books = OpenlibraryService.new.search_books(local, quantity)
  
    # Prepare the response JSON
    response_data = {
      data: {
        id: nil,
        type: 'books',
        attributes: {
          destination: location,
          forecast: {
            summary: weather_request['current']['condition']['text'],
            temperature: "#{weather_request['current']['temp_f'].to_i} F"
          },
          total_books_found: books['work_count'],
          books: books['works'].map do |book|
            {
              isbn: book['key'],
              title: book['title']
            }
          end
        }
      }
    }
  end
end