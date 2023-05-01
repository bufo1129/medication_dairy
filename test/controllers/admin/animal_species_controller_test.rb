require "test_helper"

class Admin::AnimalSpeciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_animal_species_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_animal_species_edit_url
    assert_response :success
  end
end
