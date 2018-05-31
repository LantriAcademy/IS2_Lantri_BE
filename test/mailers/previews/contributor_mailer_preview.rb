# Preview all emails at http://localhost:3000/rails/mailers/contributor_mailer
class ContributorMailerPreview < ActionMailer::Preview
    def welcome_email
        ContributorMailer.welcome_email(Contributor.first)
    end
end
