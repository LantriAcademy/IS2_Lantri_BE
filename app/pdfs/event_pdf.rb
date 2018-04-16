require "open-uri"

class EventPdf < Prawn::Document
    
    def initialize
        super
        text "HOLA MUNDO :D"
        
    end
    
    def myimage(event)
        image open("https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=600x300&maptype=roadmap&markers=color:blue|label:Event|"+event.longitude.to_s+"," + event.latitude.to_s + "&key=AIzaSyBSK3uZLHPEGHd68JImFbmjcxhvd8KbFyw")
    end
    
    
end