require "test_helper"

class Store::MedicinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_medicines_index_url
    assert_response :success
  end
end
