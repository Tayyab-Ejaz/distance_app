require 'test_helper'

class FlightPathControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flight_path_index_url
    assert_response :success
  end

end
