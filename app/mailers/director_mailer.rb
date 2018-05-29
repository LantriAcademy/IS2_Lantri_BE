class DirectorMailer < ApplicationMailer
    def welcome_email(director)
        @director = director
        mail(to: @director.email, subject: 'Welcome to fUNdaciones')
    end
    
    def reset_email(director)
        @director = director
        mail(to: @director.email, subject: 'Restaurar contraseña')
    end
    
    def info_email(director)
        @director = director
        mail(to: @director.email, subject: 'Informe de tu fundacion')
    end
end
