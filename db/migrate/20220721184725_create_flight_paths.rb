class CreateFlightPaths < ActiveRecord::Migration[6.0]
  def change
    create_table :flight_paths do |t|
      t.decimal :origin_lat, { precision: 10, scale: 6 }
      t.decimal :origin_lng, { precision: 10, scale: 6 }
      t.decimal :dest_lat, { precision: 10, scale: 6 }
      t.decimal :dest_lng, { precision: 10, scale: 6 }
      t.string :distance
      t.string :journey_time

      t.timestamps
    end
  end
end
