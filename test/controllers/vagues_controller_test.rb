require 'test_helper'

class VaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vagues_index_url
    assert_response :success
  end

  test "should get show" do
    get vagues_show_url
    assert_response :success
  end

  test "should get new" do
    get vagues_new_url
    assert_response :success
  end

  test "should get create" do
    get vagues_create_url
    assert_response :success
  end

  test "should get edit" do
    get vagues_edit_url
    assert_response :success
  end

  test "should get update" do
    get vagues_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vagues_destroy_url
    assert_response :success
  end

end
