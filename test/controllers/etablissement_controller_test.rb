require 'test_helper'

class EtablissementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get etablissement_index_url
    assert_response :success
  end

  test "should get new" do
    get etablissement_new_url
    assert_response :success
  end

  test "should get create" do
    get etablissement_create_url
    assert_response :success
  end

  test "should get edit" do
    get etablissement_edit_url
    assert_response :success
  end

  test "should get update" do
    get etablissement_update_url
    assert_response :success
  end

  test "should get show" do
    get etablissement_show_url
    assert_response :success
  end

  test "should get destroy" do
    get etablissement_destroy_url
    assert_response :success
  end

end
