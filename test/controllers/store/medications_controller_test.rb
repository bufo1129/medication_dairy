require "test_helper"

class Store::MedicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_medications_index_url
    assert_response :success
  end

  test "should get new" do
    get store_medications_new_url
    assert_response :success
  end

  test "should get show" do
    get store_medications_show_url
    assert_response :success
  end

  test "should get edit" do
    get store_medications_edit_url
    assert_response :success
  end
end
