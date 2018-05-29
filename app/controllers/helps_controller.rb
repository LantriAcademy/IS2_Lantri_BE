class HelpsController < ApplicationController
  acts_as_token_authentication_handler_for Contributor, only: [:create]
  before_action :set_help, only: [:show, :update, :destroy]

  # GET /helps
  def index
    @helps = Help.all

    render json: @helps
  end

  # GET /helps/1
  def show
    render json: @help
  end

  # POST /helps
  def create
    @help = Help.new(help_params)
    if Help.where(contributor_id: @help.contributor_id,benefited_id: @help.benefited_id).first == nil 
      if Contributor.where(authentication_token: params[:contributor_token]).first.id == @help.contributor_id
        if @help.save
          #ContributorEventMailer.subscribe_email(@help.contributor_id,@help.event_id).deliver_later
          render json: {"success": "Ok"}, status: :created
        else
          render json: @help.errors, status: :unprocessable_entity
        end
      else
        render json: {"error": "unauthorized"}, status: :unauthorized
      end
    else
      render json: {"Error": "You are already helped to this benefited"}, status: :ok
    end
  end

  # PATCH/PUT /helps/1
  def update
    if @help.update(help_params)
      render json: @help
    else
      render json: @help.errors, status: :unprocessable_entity
    end
  end

  # DELETE /helps/1
  def destroy
    @help.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help
      @help = Help.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def help_params
      params.require(:help).permit(:description, :startDate,:contributor_id,:benefited_id)
    end
end
