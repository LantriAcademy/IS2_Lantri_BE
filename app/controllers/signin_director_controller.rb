class SigninDirectorController < ApplicationController

   def create
       director = Director.where(email: params[:email]).first
        if director && director.valid_password?(params[:password])
           render json: {"id": director.id,"email": director.email, "authentication_token": director.authentication_token, "foundation_id": director.foundation_id }, status: :created
        else
            head(:unauthorized)
        end
   end
   
    def googlesign
        validator = GoogleIDToken::Validator.new
        begin
            aud = "799165598681-9udj7mf8gcg68r84lu0q3eev7vv643i8.apps.googleusercontent.com"
            data = validator.check(params[:tokenId],aud)
            director = Director.where(email: data['email']).first
            
            if director
                render json: {"id": director.id,"email": director.email, "authentication_token": director.authentication_token, "foundation_id": director.foundation_id }, status: :created
            else
                newdirector = Director.new()
                newdirector.bio = 'Sin Biografia' 
                newdirector.name = data['given_name']
                newdirector.lastname = data['family_name'] 
                newdirector.user = data['given_name']
                newdirector.email = data['email'] 
                newdirector.phone = 0
                newdirector.type_user = "google_user"
                
                if newdirector.save(validate: false)
                    ContributorMailer.welcome_email(newdirector).deliver_later
                    render json: {"id": newdirector.id,"email": newdirector.email, "authentication_token": newdirector.authentication_token, "foundation_id": newdirector.foundation_id }, status: :created
                else
                    render json: newdirector.errors, status: :unprocessable_entity
                end
                
            end
        rescue GoogleIDToken::ValidationError => e
            render json: {"Error": e} , status: :unauthorized
        end
    end
   
end