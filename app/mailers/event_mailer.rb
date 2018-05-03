class EventMailer < ApplicationMailer
    def event_create_email(director,event)
        @event = event
        @director = director
        mail(to: @director.email, subject: 'You have just created a new Event!')
    end
end
