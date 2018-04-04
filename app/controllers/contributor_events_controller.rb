class ContributorEventsController < ApplicationController
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
    @contributor_event = ContributorEvent.new(contributor_event_params)

    if @contributor_event.save
      render json: @contributor_event, status: :created, location: @contributor_event
    else
      render json: @contributor_event.errors, status: :unprocessable_entity
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
      params.fetch(:contributor_event, {})
    end
end
