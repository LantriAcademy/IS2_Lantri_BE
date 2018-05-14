class BenefitedsPdfController < ApplicationController
    
    def show
        b = Benefited.find(params[:id])
        f = Foundation.find(b.foundation_id)
        pdf = createPdf(b, nil, f)
        send_data pdf.render 
    end
    def showById 
        b = Benefited.find(params[:id])
        c = Contributor.find(params[:userId])
        f = Foundation.find(b.foundation_id)
        pdf = createPdf(b, c, f)
        send_data pdf.render 
    end
    
    def destroy
    end

    def createPdf(b, c, f)
        pdf = BenefitedPdf.new
        pdf.grid([1.3,0], [2, 11]).bounding_box do
            if c != nil
                pdf.text c.name + " "  + c.lastname + " agradecemos tu ayuda", :size => 24, :align => :center
            else
                pdf.text "Agradecemos tu ayuda", :size => 28, :align => :center
            end
        end
        pdf.grid([2, 0], [4, 5]).bounding_box do 
            if b.avatar.current_path == nil 
                pdf.image "public/images/fallback/default.png" , :width => 220 , :height => 180
            else
                pdf.image b.avatar.current_path , :width => 220 , :height => 180
            end
        end
        pdf.grid([2,5] , [4,11]).bounding_box do 
            pdf.text "Mi nombre es " +  b.name + " y tengo " + b.age.to_s + " yo pertenezco de la fundación " + f.name + " y lo que más me gusta es: "
            pdf.text "<br />" + b.preferences , :inline_format => true
        end 
        
        pdf.grid([5,0], [6, 11]).bounding_box do
            pdf.text "Con tu apoyo crearemos un <strong>mejor</strong> mañana" , :size => 20, :inline_format => true, :color => '2C7925', :align => :center
        end
        #pdf.filename e.id.to_s + "_Event.pdf"
        return pdf 
    end

end
