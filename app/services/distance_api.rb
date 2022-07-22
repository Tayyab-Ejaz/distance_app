class DistanceApi
  def initialize(flight_params)
    @flight_params = flight_params
  end

  def get_flight_path
    api_url = ENV['radar_api_base_uri']
    options = { query: api_params, headers: { Authorization: ENV['radar_api_key']}}
    api_respones = HTTParty.get(api_url, options)
    if api_respones['meta']['code'] == 200
      @flight_params[:distance] = api_respones['routes']['car']['distance']['text']
      @flight_params[:journey_time] = api_respones['routes']['car']['duration']['text']
      flight_path = FlightPath.new(@flight_params)
      if flight_path.save
        flight_path
      else
        false
      end
    else
      false
    end
  end

  private

  def api_params
    {
      origin: "#{@flight_params[:origin_lat]},#{@flight_params[:origin_lng]}",
      destination: "#{@flight_params[:dest_lat]},#{@flight_params[:dest_lng]}",
      modes: 'car',
      units: 'imperial'
    }
  end
end