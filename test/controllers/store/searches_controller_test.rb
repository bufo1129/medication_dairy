require "test_helper"

class Store::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get store_searches_search_url
    assert_response :success
  end
end
