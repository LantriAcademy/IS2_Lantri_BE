class SigninDirectorController < ApplicationController
    acts_as_token_authentication_handler_for Director, only: [:singout]
    
    def create
       director = Director.where(email: params[:email]).first
       logger_sing = ActiveSupport::TaggedLogging.new(Logger.new("login.log"))
        if director && director.valid_password?(params[:password])
            director.disable_count = 0 
            director.save
            logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign In Director: " + director.email + " SUCCESS") }
            render json: {"id": director.id,"email": director.email, "authentication_token": director.authentication_token, "foundation_id": director.foundation_id }, status: :created
        else
            director.disable_count = director.disable_count + 1
            director.save
            logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign In Director: " + director.email + " SUCCESS") }
            if director.disable_count % 5 == 0
               #MAILER 
            end
            head(:unauthorized)
        end
    end
    
    def singout
        director = Director.where(email: params[:email]).first
        if director && director.authentication_token == params[:director_token]
            logger_sing = ActiveSupport::TaggedLogging.new(Logger.new("login.log"))
            logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign Out Director: " + director.email) }
            director.authentication_token = Devise.friendly_token
            director.save
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
            director = Director.where(email: data['email']).first
            
            if director
                logger_sing = ActiveSupport::TaggedLogging.new(Logger.new("login.log"))
                logger_sing.tagged("IP: #{request.ip} Date: #{Time.now}") { logger_sing.info ("Sign In Director: " + director.email+ " SUCCESS - Google" ) }
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