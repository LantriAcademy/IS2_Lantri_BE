require "open-uri"

class EventPdf < Prawn::Document
    
    def initialize
        super
        define_grid(:columns => 12, :rows => 10, :gutter => 10)
        font "Helvetica"
        grid([0, 0], [0, 6]).bounding_box do
            text "f<b>UN</b>daciones", :size => 36, :inline_format => true, :color => '2C7925'
        end
        grid([0,8], [0, 11]).bounding_box do 
            text "Te agradecemos por", :align => :center
            text "construir <b>país</b> con nosotros", :align => :center, :inline_format => true
        end
        stroke_horizontal_rule 
    end
    
    def myimage(event)
        image open("https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=600x300&maptype=roadmap&markers=color:blue|label:Event|"+event.longitude.to_s+"," + event.latitude.to_s + "&key=AIzaSyBSK3uZLHPEGHd68JImFbmjcxhvd8KbFyw"), :width => 550
    end
    
    
end