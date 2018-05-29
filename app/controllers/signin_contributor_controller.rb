class SigninContributorController < ApplicationController

    def create
        contributor = Contributor.where(email: params[:email]).first
        if contributor && contributor.valid_password?(params[:password])
           render json: {"email": contributor.email, "authentication_token": contributor.authentication_token, "contributor_id": contributor.id}, status: :created
        else
            head(:unauthorized)
        end
    end
   
    def googlesign
        validator = GoogleIDToken::Validator.new
        begin
            aud = "799165598681-9udj7mf8gcg68r84lu0q3eev7vv643i8.apps.googleusercontent.com"
            data = validator.check(params[:tokenId],aud)
            contributor = Contributor.where(email: data['email']).first
            
            if contributor
                render json: {"email": contributor.email, "authentication_token": contributor.authentication_token, "contributor_id": contributor.id}, status: :created
            else
                newcontributor = Contributor.new()
                newcontributor.description = 'Sin descripcion' 
                newcontributor.name = data['given_name']
                newcontributor.lastname = data['family_name'] 
                newcontributor.user = data['given_name']
                newcontributor.email = data['email'] 
                newcontributor.phone = 0
                newcontributor.type_user = "google_user"
                
                if newcontributor.save(validate: false)
                    ContributorMailer.welcome_email(newcontributor).deliver_later
                    render json: {"email": newcontributor.email, "authentication_token": newcontributor.authentication_token, "contributor_id": newcontributor.id}, status: :created
                else
                    render json: newcontributor.errors, status: :unprocessable_entity
                end
                
            end
        rescue GoogleIDToken::ValidationError => e
            render json: {"Error": e} , status: :unauthorized
        end
    end
    
end