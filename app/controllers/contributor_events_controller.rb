class ContributorEventsController < ApplicationController
  acts_as_token_authentication_handler_for Contributor, only: [:create]
  
  before_action :set_contributor_event, only: [:show, :update, :destroy]

  # GET /contributor_events
  def index
    @contributor_events = ContributorEvent.all

    render json: @contributor_events
  end

  # GET /contributor_events/1
  def show
    render json: @contributor_event
  end

  # POST /contributor_events
  def create
    if ContributorEvent.where(contributor_id: params[:contributor_id],event_id: params[:event_id]) == nil 
      @contributor_event = ContributorEvent.new(contributor_event_params)
      if Contributor.where(authentication_token: params[:contributor_token]).first.id == @contributor_event.contributor_id
        if @contributor_event.save
          render json: {"success": "Ok"}, status: :created
        else
          render json: @contributor_event.errors, status: :unprocessable_entity
        end
      else
        render json: {"error": "unauthorized"}, status: :unauthorized
      end
    else
      render json: {"Error": "You are already subscribed to the event"}, status: :unauthorized
    end
    
  end

  # PATCH/PUT /contributor_events/1
  def update
    if @contributor_event.update(contributor_event_params)
      render json: @contributor_event
    else
      render json: @contributor_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contributor_events/1
  def destroy
    @contributor_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor_event
      @contributor_event = ContributorEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contributor_event_params
      params.require(:contributor_event).permit(:contributor_id,:event_id)
    end
end
