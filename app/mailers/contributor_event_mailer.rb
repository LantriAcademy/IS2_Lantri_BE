class ContributorEventMailer < ApplicationMailer
    def subscribe_email(contributor,event)
        @contributor = Contributor.find(contributor)
        @event = Event.find(event)
        mail(to: @contributor.email, subject: 'You have just subscribed to an event: ' + @event.name)
    end
end
