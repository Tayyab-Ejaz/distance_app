class FlightPathsController < ApplicationController
  before_action :flight_paths, only: [:index]

  def index
  end

  def calculate_flight
    @flight_path = DistanceApi.new(flight_params).get_flight_path
  end

  def flight_paths
    @flight_paths = FlightPath.all
  end

  def flight_params
    params.require(:flight).permit(:origin_lat, :origin_lng, :dest_lat, :dest_lng)
  end
end
