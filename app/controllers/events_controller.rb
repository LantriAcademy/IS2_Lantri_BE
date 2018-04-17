class EventsController < ApplicationController
  acts_as_token_authentication_handler_for Director, only: [:create]
  
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    if Director.where(authentication_token: params[:director_token]).first.foundation_id == @event.foundation_id
      if @event.save
        EventMailer.event_create_email(Director.where(authentication_token: params[:director_token]).first,@event).deliver_later
        render json: @event, status: :created, location: @event
      else
        render json: @event.errors, status: :unauthorized
      end
    else
      render json: {"error": "unauthorized"}, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:startDate, :direction, :latitude, :longitude, :description, :foundation_id, :name)
    end
end
