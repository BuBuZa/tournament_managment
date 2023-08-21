require "test_helper"

class TournamentControllerTest < ActionDispatch::IntegrationTest
  test "should get schedule" do
    get tournament_schedule_url
    assert_response :success
  end
end
