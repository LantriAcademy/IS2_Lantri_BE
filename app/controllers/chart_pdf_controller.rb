class ChartPdfController < ApplicationController
    def show
        pdf = createPdf(params[:title], params[:chart])
        send_data pdf.render 
    end
    def destroy
    end
    def createPdf(title, chart)
        pdf = ChartPdf.new
        pdf.grid([1.3,0], [3, 11]).bounding_box do
            pdf.text title, :size => 35, :align => :center
        end
        pdf.grid([2, 0], [7, 11]).bounding_box do 
            chart = chart.split(',');
            File.open('public/images/charts/image.png', 'wb') do |f|
                f.write(Base64.decode64(chart[1]))  
                pdf.image "public/images/charts/image.png", :width => 600 , :height => 330
            end
        end
        
        return pdf 
    end
end
