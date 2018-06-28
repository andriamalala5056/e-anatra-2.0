class ContactMailer < ApplicationMailer
    attr_accessor :responsable, :etudiant, :etab
    default from: 'andryhaj@gmail.com'
    def contact(destinataire, message)
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
    def inscrit(etudiant,etab)
        @etudiant = etudiant
        @etab = etab
        mail(to: "#{@etudiant.email}", subject:"inscription reussi")
    end
    def validate(etudiant,responsable)
        @etudiant = etudiant
        @responsable = responsable
        mail(to: "#{@etudiant.email}", subject: "Inscription validée ")
    end
end
