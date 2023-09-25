class Api::V1::BookSearchController < ApplicationController
  def index
    location = params[:location]
    quantity = params[:quantity].to_f

    # Validate the quantity parameter
    if quantity <= 0 || quantity.to_i != quantity
      render json: { error: 'Quantity must be a positive integer greater than 0' }, status: :bad_request
      return
    end

    payload = BookSearchFacade.book_search(location, quantity)
    

    render json: response_data
  end
end
