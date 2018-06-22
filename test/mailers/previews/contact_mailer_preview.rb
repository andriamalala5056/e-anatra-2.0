# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def contact
        ContactMailer.contact(Role.first.role_name)
    end
end
