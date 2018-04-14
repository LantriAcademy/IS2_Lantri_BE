class DirectorMailer < ApplicationMailer
    def welcome_email(director)
        @director = director
        mail(to: @director.email, subject: 'Welcome to fUNdaciones')
    end
end
