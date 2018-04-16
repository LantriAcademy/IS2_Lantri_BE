class EventsPdfController < ApplicationController

    def show
          e = Event.find(1)
          pdf = EventPdf.new
          pdf.myimage(e)
          send_data pdf.render        

    end
   
   def destroy
   end
   
end

