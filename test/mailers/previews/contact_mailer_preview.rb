# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def contact
        @subject = "test2"
        @message_body = 'If you are a senior Ruby developer, thredUP is hiring. Please email me, seriously. Final'
        message = {}
        message[:subject] = @subject
        message[:email] = 'andryhaj@gmail.com'
        message[:name]  = 'Andry'
        message[:body]  = @message_body
        ContactMailer.contact(message).deliver_now
    end
end
