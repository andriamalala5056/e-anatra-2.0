class ContactMailer < ApplicationMailer
    default from: 'andryhaj@gmail.com'
    def contact(message)
        @message_body = 'If you are a senior Ruby developer, thredUP is hiring. Please email me, seriously. Final'
        mail :subject => "#{message[:subject]} from: #{message[:name]}",
        :to      => "eanatramada@gmail.com",
        :from    => message[:email],
        :body => message[:body]#message[:message]
    end
end
