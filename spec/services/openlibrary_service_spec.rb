require 'rails_helper'

RSpec.describe OpenlibraryService do
  describe '#search_books(location, quantity)' do
    it 'should return a list of books about a location', :vcr do
      location = 'new+york+new+york'
      quantity = 5

      parsed = OpenlibraryService.new.search_books(location, quantity)

      expect(parsed['numFound']).to be_a(Integer)
      expect(parsed['docs']).to be_a(Array)
      docs = parsed['docs']

      expect(docs.count).to eq(5)
      expect(docs[0]['type']).to eq('work')
      expect(docs[0]['title']).to be_a(String)
      expect(docs[0]['isbn']).to be_a(Array)
    end
  end
end