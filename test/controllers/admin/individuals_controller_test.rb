require "test_helper"

class Admin::IndividualsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_individuals_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_individuals_show_url
    assert_response :success
  end
end
