require "test_helper"

class Store::IndividualsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_individuals_index_url
    assert_response :success
  end

  test "should get new" do
    get store_individuals_new_url
    assert_response :success
  end

  test "should get show" do
    get store_individuals_show_url
    assert_response :success
  end

  test "should get edit" do
    get store_individuals_edit_url
    assert_response :success
  end
end
