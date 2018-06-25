class MailingController < ApplicationController
  def index
    @message_mailing = Mailing.last
    @destinataires = Newsletter.all
    # message = {}
    # message[:subject] = @message_mailing.subject
    # message[:email] = 'andryhaj@gmail.com'
    # message[:name]  = 'Andry'
    # message[:body]  = @message_mailing.message
    # ContactMailer.contact(message).deliver_now
    @destinataires.each do |destinataire|
      ContactMailer.contact(destinataire, Mailing.last).deliver_now
    end
  end

  def new
    @mailing = Mailing.new
  end

  def create
    @mailing = Mailing.create(subject: params['subject'], message: params['message'])
    if @mailing.save
      redirect_to mailing_index_path
    else
      render "new"
    end
  end
end
