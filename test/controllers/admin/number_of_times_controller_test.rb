require "test_helper"

class Admin::NumberOfTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_number_of_times_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_number_of_times_show_url
    assert_response :success
  end
end
