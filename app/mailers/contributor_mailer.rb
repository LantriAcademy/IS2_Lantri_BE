class ContributorMailer < ApplicationMailer
    def welcome_email(contributor)
        @contributor = contributor
        mail(to: @contributor.email, subject: 'Welcome to fUNdaciones')
    end
    def reset_email(contributor)
        @contributor = contributor
        mail(to: @contributor.email, subject: 'Restaurar contraseña')
    end
    
end
