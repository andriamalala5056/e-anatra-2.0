require 'twitter'
require 'dotenv'
Dotenv.load

class BotTwitterController < ApplicationController
  before_action :client
  before_action :pattern, only: [:get_screen_name, :get_status_id]

  def direct_message
    # @usernames = []
    # message = ""
    # get_followers.each do |username|
    #   clien.create_direct_message(username, message, options={})
    #   @usernames << username
    # end
    @usernames = TwitterFollower.all
    @usernames.each do |username|
      clien.create_direct_message(username, message, options={})
    end
  end

  def get_followers
    @followers = client.followers
    @tab_follower = []
    @followers.each do |follower|
      @saved_follower = TwitterFollower.create(follower: follower)
      @tab_follower << follower
    end
  end

  def get_screen_name
    @tab_user_screen_name = []
    client.search(@pattern, options = {geocode: "-18.8667338,47.5299638,1100km", result_type: "recent"}).take(100).collect do |tweet|
      @tab_user_screen_name << tweet.user.screen_name
    end
    return @tab_user_screen_name
  end

  def get_status_id
    @tab_status = []
    client.search(@pattern, options = {geocode: "-18.8667338,47.5299638,1100km", result_type: "recent"}).take(100).collect do |tweet|
      @tab_status << tweet.id
    end
    return @tab_status
  end

  def send_public_tweet
    message = "Découvrir E-anatra via sa page facebook https://www.facebook.com/events/37320524317682"
    client.update_with_media(message, File.new("./images/bot/image_eanatra.jpg"))
  end

  def send_private_tweet
    @tab_users = []
    @infos_users = Hash.new
    @tab_username = get_screen_name
    i = 0
    get_status_id.each do |id|
      @infos_users[id] = @tab_username[i]
      i += 1
    end

    @infos_users.each do |id, username|
      message = "@#{username} Nous venons d'ouvrir un site pour faciliter la #recherche d'un #établissement #scolaire à #Madagascar. Visitez #eanatra via sa page facebook https://www.facebook.com/events/37320524317682/"
      client.update_with_media(message, File.new("public/images/bot/e-anatra.png"), in_reply_to_status_id: id)
      @tab_users << username
    end
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end 
  end

  def pattern
    @pattern = ("établissement" or "etablissement" or
      "école" or "ecole" or
      "université" or "universite" or
      "étudiant" or "etudiant" or
      "mpianatra" or "mianatra" or "hianatra")
  end

end
