class SigninDirectorController < ApplicationController

   def create
       
       director = Director.where(email: params[:email]).first
       
        if director && director.valid_password?(params[:password])
           render json: director.as_json(only: [:email, :authentication_token]), status: :created
        else
            head(:unauthorized)
        end
   end
   
   def destroy
   end
   
end