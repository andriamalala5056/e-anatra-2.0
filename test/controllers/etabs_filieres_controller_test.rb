require 'test_helper'

class EtabsFilieresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get etabs_filieres_index_url
    assert_response :success
  end

  test "should get new" do
    get etabs_filieres_new_url
    assert_response :success
  end

  test "should get create" do
    get etabs_filieres_create_url
    assert_response :success
  end

  test "should get edit" do
    get etabs_filieres_edit_url
    assert_response :success
  end

  test "should get update" do
    get etabs_filieres_update_url
    assert_response :success
  end

  test "should get destroy" do
    get etabs_filieres_destroy_url
    assert_response :success
  end

end
