class FlightPathDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      Latitude: { source: "User.origin_lat" },
      Longitude:  { source: "User.origin_lng" },
      Latitude:      { source: "User.dest_lat" },
      Longitude:        { source: "User.dest_lng" }
      Distance:        { source: "User.distance" }
      Duration:        { source: "User.journey_time" }
    }
  end

  def data
    records.map do |record|
      {
        [
          record.origin_lat,
          record.origin_lng,
          record.dest_lat,
          record.dest_lng,
          record.distance
          record.journey_time
        ]
      }
    end
  end

  def get_raw_records
    FlightPath.all
  end

end
