require 'test_helper'

class BotTwitterControllerTest < ActionDispatch::IntegrationTest
  test "should get direct_message" do
    get bot_twitter_direct_message_url
    assert_response :success
  end

  test "should get get_followers" do
    get bot_twitter_get_followers_url
    assert_response :success
  end

  test "should get get_screen_name" do
    get bot_twitter_get_screen_name_url
    assert_response :success
  end

  test "should get send_public_tweet" do
    get bot_twitter_send_public_tweet_url
    assert_response :success
  end

  test "should get send_private_tweet" do
    get bot_twitter_send_private_tweet_url
    assert_response :success
  end

  test "should get client" do
    get bot_twitter_client_url
    assert_response :success
  end

end
