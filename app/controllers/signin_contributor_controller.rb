class SigninContributorController < ApplicationController
    acts_as_token_authentication_handler_for Contributor, only: [:singout]

    def create
        contributor = Contributor.where(email: params[:email]).first
        logger_sing = ActiveSupport::TaggedLogging.new(Logger.new("login.log"))
        if contributor.disable_count > 5 
            render json: {"Error ":"account disabled by too many attempts"}, status: :unauthorized
        elsif contributor && contributor.valid_password?(params[:password])
            contributor.disable_count = 0 
            contributor.save
            logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign In Contributor: " + contributor.email + " SUCCESS") }
            render json: {"email": contributor.email, "authentication_token": contributor.authentication_token, "contributor_id": contributor.id}, status: :created
        else
            contributor.disable_count = contributor.disable_count + 1
            contributor.save
            logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign In Contributor: " + contributor.email + " FAIL") }
            if contributor.disable_count == 5
                DisableAccount.set(wait: 15.minutes).perform_later(contributor.id,"contributor")
                #MAILER
            end
            head(:unauthorized)
        end
    end
    
    def singout
        contributor = Contributor.where(email: params[:email]).first
        if contributor && contributor.authentication_token == params[:contributor_token]
            logger_sing = ActiveSupport::TaggedLogging.new(Logger.new("login.log"))
            logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign Out Contributor: " + contributor.email) }
            contributor.authentication_token = Devise.friendly_token
            contributor.save
            render json: {"Status":"OK"}, status: :ok
        else
            render json: {"Error":"Invalid Email"}
        end
    end
    
    def googlesign
        validator = GoogleIDToken::Validator.new
        begin
            aud = "799165598681-9udj7mf8gcg68r84lu0q3eev7vv643i8.apps.googleusercontent.com"
            data = validator.check(params[:tokenId],aud)
            contributor = Contributor.where(email: data['email']).first
            
            if contributor
                logger_sing = ActiveSupport::TaggedLogging.new(Logger.new("login.log"))
                logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign In Contributor: " + contributor.email + " SUCCESS - Google") }
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