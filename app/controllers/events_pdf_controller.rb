class EventsPdfController < ApplicationController

    def show
        e = Event.find(1)
        pdf = createPdf(e)
        send_data pdf.render 
    end
    def showById 
        e = Event.find(params[:id])
        pdf = createPdf(e)
        send_data pdf.render 
    end
    def destroy
    end

    def createPdf(e)
        pdf = EventPdf.new
        pdf.grid([1.3,0], [3,6]).bounding_box do 
            pdf.text "<b>Título:</b> " + e.name, :inline_format => :true
            pdf.text "<b>Dirección:</b> " + e.direction, :inline_format => :true
            pdf.text "<b>Descripción:</b> " + e.description, :inline_format => :true
        end
        pdf.grid([1.3,7], [3,11]).bounding_box do 
            pdf.image "#{Rails.root}/app/img/fundacion1.jpg", :width => 220 , :height => 180
        end
        pdf.grid([4,0], [4,11]).bounding_box do 
            pdf.text "<b>¿Cómo llegar?</b>", :inline_format => true, :size => 30
        end
        pdf.grid([5,0], [9,11]).bounding_box do 
            pdf.myimage(e)
        end
        #pdf.filename = e.id + "_Event.pdf"
        return pdf 
    end
   
end

