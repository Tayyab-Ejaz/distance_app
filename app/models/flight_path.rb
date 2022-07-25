class FlightPath < ApplicationRecord
  validates :origin_lat, :dest_lat, numericality: { greater_than: -90, less_than_or_equal_to: 90 }, presence: true
  validates :origin_lng, :dest_lng, numericality: { greater_than: -180, less_than_or_equal_to: 180 }, presence: true

  validate :origin_and_destination_cannot_be_same

  def origin_and_destination_cannot_be_same
    if origin_lat == dest_lat && origin_lng == dest_lng
        errors.add(:same_origin_destination, "Origin and Destination are same")
    end
  end
end
