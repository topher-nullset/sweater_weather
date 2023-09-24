class Api::V0::ForecastController < ApplicationController
  def index
    location = params[:location]

    forecast_data = ForecastFacade.get_forecast(location)

    render json: forecast_data, status: :ok

  end
end
