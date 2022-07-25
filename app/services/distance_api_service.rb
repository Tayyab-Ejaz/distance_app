class DistanceApiService
  
  RADAR_API_BASE_URL = 'https://api.radar.io/v1/route/distance'

  def initialize(flight_params)
    @flight_params = flight_params
  end

  def execute
    flight_path = FlightPath.new(@flight_params)
    if flight_path.valid?
      api_response = fetch_data
      if api_response['meta']['code'] == 200
        distance = api_response['routes']['car']['distance']['text']
        duration = api_response['routes']['car']['duration']['text']
        flight_path.update(distance: distance, journey_time: duration)
      else
        flight_path.errors.add(:failed, api_response['meta']['message'])
      end
    end
    flight_path
  end

  private

  def fetch_data
    options = { query: api_params, headers: { Authorization: ENV['radar_api_key']}}
    HTTParty.get(RADAR_API_BASE_URL, options)
  end

  def api_params
    {
      origin: "#{@flight_params[:origin_lat]},#{@flight_params[:origin_lng]}",
      destination: "#{@flight_params[:dest_lat]},#{@flight_params[:dest_lng]}",
      modes: 'car',
      units: 'imperial'
    }
  end
end