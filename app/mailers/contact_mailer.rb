class ContactMailer < ApplicationMailer
    default from: 'andryhaj@gmail.com'
    def contact(message)
        mail :subject => "New website message from: #{message[:name]}",
        :to      => "eanatramada@gmail.com",
        :from    => message[:email],
        :body => message[:message]
    end
end
