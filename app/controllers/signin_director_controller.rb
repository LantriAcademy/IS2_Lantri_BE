class SigninDirectorController < ApplicationController

   def create
       
       director = Director.where(email: params[:email]).first
       
        if director && director.valid_password?(params[:password])
           render json: {"email": director.email, "authentication_token": director.authentication_token, "foundation_id": director.foundation_id }, status: :created
        else
            head(:unauthorized)
        end
   end
   
   def destroy
   end
   
end