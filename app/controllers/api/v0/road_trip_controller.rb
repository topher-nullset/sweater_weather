class Api::V0::RoadTripController < ApplicationController
  before_action :authenticate_user

  def create
    road_trip = RoadTripFacade.create_road_trip(road_trip_params)
    render json: road_trip, status: :created
  end

  private

  def authenticate_user
    key = params[:api_key]
    user = User.find_by(api_key: key)

    unless user
      render json: { error: 'Invalid API key' }, status: :unauthorized
    end
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end