class ContributorMailer < ApplicationMailer
    def welcome_email(contributor)
        @contributor = contributor
        mail(to: @contributor.email, subject: 'Welcome to fUNdaciones')
    end
end
