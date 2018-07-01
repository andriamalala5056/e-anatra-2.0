class ContactMailer < ApplicationMailer
    attr_accessor :responsable, :etudiant, :etab
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

    def new_subscription(responsable,etudiant)
        @responsable = responsable
        @etudiant = etudiant
        mail(to: "#{@responsable.email}", subject:"nouvelle inscription")
        
    end
    def inscrit(etudiant,responsable)
        @etudiant = etudiant
        @responsable = responsable
        mail(to: "#{@etudiant.email}", subject:"inscription reussi")
    end
end
