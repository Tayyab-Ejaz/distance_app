class FlightPathsController < ApplicationController
  def index
    @flight_paths = FlightPath.all
  end

  def calculate_distance
    @flight_path = DistanceApiService.new(flight_params).execute
  end
  
  private
  def flight_params
    params.require(:flight).permit(:origin_lat, :origin_lng, :dest_lat, :dest_lng)
  end
end
