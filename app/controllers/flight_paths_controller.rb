class FlightPathsController < ApplicationController
  before_action :flight_paths, only: [:index]

  def index
    respond_to do |format|
      format.html
    end
  end

  def calculate_flight
    response = DistanceApi.new(flight_params).get_flight_path
    if response.present?
      @flight_path = response
    else
      render status: 400, message: 'Coulnd fetch flight path data!'
    end
  end

  def flight_paths
    @flight_paths = FlightPath.all
  end

  def flight_params
    params.require(:flight).permit(:origin_lat, :origin_lng, :dest_lat, :dest_lng)
  end
end
