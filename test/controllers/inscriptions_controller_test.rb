require 'test_helper'

class InscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inscriptions_index_url
    assert_response :success
  end

  test "should get show" do
    get inscriptions_show_url
    assert_response :success
  end

  test "should get new" do
    get inscriptions_new_url
    assert_response :success
  end

  test "should get create" do
    get inscriptions_create_url
    assert_response :success
  end

  test "should get edit" do
    get inscriptions_edit_url
    assert_response :success
  end

  test "should get update" do
    get inscriptions_update_url
    assert_response :success
  end

  test "should get delete" do
    get inscriptions_delete_url
    assert_response :success
  end

end
