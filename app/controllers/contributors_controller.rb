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
  
    # POST /contributors
  def create
    @contributor = Contributor.new(contributor_params)

    if @contributor.save
      ContributorMailer.welcome_email(@contributor).deliver_later
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
      params.require(:contributor).permit(:description, :user, :password, :name, :lastname, :email, :phone, :avatar)
    end
    
end
