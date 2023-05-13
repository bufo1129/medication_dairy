require "test_helper"

class Admin::SeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_seeds_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_seeds_edit_url
    assert_response :success
  end
end
