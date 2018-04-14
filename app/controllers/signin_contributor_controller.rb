class SigninContributorController < ApplicationController

   def create
       
       contri = Contributor.where(email: params[:email]).first
       
        if contri && contri.valid_password?(params[:password])
           render json: {"email": contri.email, "authentication_token": contri.authentication_token}, status: :created
        else
            head(:unauthorized)
        end
   end
   
   def destroy
   end
   
end