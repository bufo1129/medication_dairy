require "test_helper"

class Admin::WeathersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_weathers_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_weathers_edit_url
    assert_response :success
  end
end
