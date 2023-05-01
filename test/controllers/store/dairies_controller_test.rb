require "test_helper"

class Store::DairiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_dairies_index_url
    assert_response :success
  end

  test "should get new" do
    get store_dairies_new_url
    assert_response :success
  end

  test "should get show" do
    get store_dairies_show_url
    assert_response :success
  end

  test "should get edit" do
    get store_dairies_edit_url
    assert_response :success
  end
end
