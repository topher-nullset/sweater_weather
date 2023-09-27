class OpenlibraryService
  BASE_URL = 'https://openlibrary.org'.freeze

  def initialize
    @conn = Faraday.new(url: BASE_URL)
  end

  def search_books(location, quantity)
    response = @conn.get do |req|
      req.url "/search.json?q=#{location}&limit=#{quantity.to_i}"
    end

    JSON.parse(response.body)
  end
end