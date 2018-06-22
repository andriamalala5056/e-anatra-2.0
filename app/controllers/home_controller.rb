class HomeController < ApplicationController
  def index
    ContactMailer.contact('andryhaj@gmail.com').deliver_now
  end
end
