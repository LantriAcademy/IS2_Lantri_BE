class ContributorsController < ApplicationController
  acts_as_token_authentication_handler_for Contributor, only: [:show,:update]
  before_action :set_contributor, only: [:show, :update, :destroy]

  # GET /contributors
  def index
    @contributors = Contributor.all
    render json: @contributors
  end

  # GET /contributors/1
  def show
      if Contributor.where(authentication_token: params[:contributor_token]).first.id == @contributor.id
        render json: @contributor
      else
        render json: @contributor.errors, status: :unauthorized
      end
  end
  
  def years_event
    arr = Contributor.GetYearsEvent(params[:id])
    render json: arr
  end
  
  def years_event_data
    arr = Contributor.GetYearsEventData(params[:year],params[:id])
    render json: arr
  end
  
  def reset_password 
    @contributor = Contributor.where(email: params[:email]).first
    if @contributor and @contributor.type_user == "normal_user"
      # Create Token 
      @contributor.token_reset_pass = Devise.friendly_token
      @contributor.save
      # Job end
      ResetTokenPasswordJob.set(wait: 2.hours).perform_later(@contributor.id,"contributor")
      # mandar email
      ContributorMailer.reset_email(@contributor).deliver_later
      render json: {"status": "OK"},  status: :ok
    else
      render json: {"error": "email is invalid " + params[:email] + " " + @contributor.type_user}, status: :not_acceptable
    end
  end
  
  def change_password
    @contributor = Contributor.where(email: params[:email]).first
    if @contributor and @contributor.token_reset_pass != nil and @contributor.token_reset_pass == params[:reset_token]
      if @contributor.update(params.require(:contributor).permit(:password,:password_confirmation))
        @contributor.token_reset_pass = nil
        @contributor.save
        render json: {"status": "OK"} ,status: :ok
      else
        render json: @contributor.errors, status: :unprocessable_entity
      end
    else
      render json: {"error": "reset token is invalid or expired"}, status: :not_acceptable
    end
  end
  
  
    # POST /contributors
  def create
    @contributor = Contributor.new(contributor_params)
    @contributor.type_user = "normal_user"
    if @contributor.save
      ContributorMailer.welcome_email(@contributor).deliver_later
      params[:interest].each do |word|
        @interest = Interest.find_by_name(word.downcase)
        if(@interest == nil)
          @interest = Interest.create(:name => word.downcase)
        end
        InterestContributor.create({:interest_id => @interest.id, :contributor_id  => @contributor.id})
      end
      render json: @contributor, status: :created, location: @contributor
    else
      render json: @contributor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contributors/1
  def update
    if @contributor.update(contributor_params)
      render json: @contributor, status: :ok
    else
      render json: @contributor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contributors/1
  def destroy
    @contributor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor
      @contributor = Contributor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contributor_params
      params.require(:contributor).permit(:description, :user, :password, :name, :lastname, :email, :phone, :avatar,:password_confirmation)
    end
    
end
