require 'test_helper'

class ProvinceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get province_index_url
    assert_response :success
  end

  test "should get new" do
    get province_new_url
    assert_response :success
  end

  test "should get show" do
    get province_show_url
    assert_response :success
  end

  test "should get edit" do
    get province_edit_url
    assert_response :success
  end

  test "should get update" do
    get province_update_url
    assert_response :success
  end

end
