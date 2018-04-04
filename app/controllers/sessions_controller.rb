class SessionsController < ApplicationController
    
   def create
       
       contri = Contributor.where(email: params[:email]).first
       
        if contri.valid_password?(params[:password])
           render json: contri.as_json(only: [:email, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
   end
   
   def destroy
   end
   
   
    
    
end