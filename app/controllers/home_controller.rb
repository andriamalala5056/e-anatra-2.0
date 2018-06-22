class HomeController < ApplicationController
  def index
    # ContactMailer.contact('eanatramada@gmail.com').deliver_now
    # ContactMailer.contact('eanatramada@gmail.com').deliver_now
    message = {}
    message[:email] = 'andryhaj@gmail.com'
    message[:name]  = 'Andry'
    message[:body]  = 'If you are a senior Ruby developer, thredUP is hiring. Please email me, seriously.'
    ContactMailer.contact(message).deliver_now
  end
end
