require "open-uri"

class EventPdf < Prawn::Document
    
    def initialize
        super
        define_grid(:columns => 12, :rows => 10, :gutter => 10)
        grid([0, 0], [0, 11]).show
        grid([1, 0], [1, 6]).show
        grid([1, 7], [3, 11]).show
        grid([2, 0], [3, 6]).show
        grid([4, 0], [4, 11]).show
        grid([5, 0], [9, 11]).show
        start_new_page
        define_grid(:columns => 12, :rows => 10, :gutter => 10)
        grid.show_all
    end
    
    def myimage(event)
        image open("https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=600x300&maptype=roadmap&markers=color:blue|label:Event|"+event.longitude.to_s+"," + event.latitude.to_s + "&key=AIzaSyBSK3uZLHPEGHd68JImFbmjcxhvd8KbFyw")
    end
    
    
end