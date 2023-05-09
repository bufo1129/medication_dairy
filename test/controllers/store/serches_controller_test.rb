require "test_helper"

class Store::SerchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get store_serches_search_url
    assert_response :success
  end
end
