require "test_helper"

class Store::EachStoresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get store_each_stores_show_url
    assert_response :success
  end

  test "should get edit" do
    get store_each_stores_edit_url
    assert_response :success
  end
end
