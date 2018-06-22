require 'test_helper'

class FilieresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get filieres_new_url
    assert_response :success
  end

  test "should get create" do
    get filieres_create_url
    assert_response :success
  end

end
