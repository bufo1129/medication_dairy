require "test_helper"

class Admin::MedicinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_medicines_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_medicines_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_medicines_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_medicines_edit_url
    assert_response :success
  end
end
