class ChartPdfController < ApplicationController
    def show
        pdf = createPdf()
        send_data pdf.render 
    end
    def destroy
    end
    def createPdf()
        pdf = ChartPdf.new

        pdf.grid([2, 0], [4, 5]).bounding_box do 
            pdf.svg IO.read("public/images/svg/410.svg"), :width => 220, :height => 180
        end
        return pdf 
    end

end
