require 'test_helper'

class MailingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailing_index_url
    assert_response :success
  end

  test "should get new" do
    get mailing_new_url
    assert_response :success
  end

  test "should get create" do
    get mailing_create_url
    assert_response :success
  end

end
