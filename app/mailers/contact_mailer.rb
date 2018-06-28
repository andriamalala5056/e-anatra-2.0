class ContactMailer < ApplicationMailer
    default from: 'andryhaj@gmail.com'
    def contact(destinataire, message)
        # attachments['free_book.pdf'] = File.read('path/to/file.pdf')
        @destinataire = destinataire
        @message = message
        # mail :subject => "#{message[:subject]} from: #{message[:name]}",
        # :to      => "eanatramada@gmail.com",
        # :from    => message[:email],
        # :body => message[:message]#message[:body]
        mail(to: "#{@destinataire.email}", subject:"#{@message.subject}")
    end
end
