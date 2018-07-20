require 'test_helper'

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get get-location" do
    get event_get-location_url
    assert_response :success
  end

end
