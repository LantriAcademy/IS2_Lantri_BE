class StatusOfHelpsController < ApplicationController
  before_action :set_status_of_help, only: [:show, :update, :destroy]

  # GET /status_of_helps
  def index
    @status_of_helps = StatusOfHelp.all

    render json: @status_of_helps
  end

  # GET /status_of_helps/1
  def show
    render json: @status_of_help
  end

  # POST /status_of_helps
  def create
    @status_of_help = StatusOfHelp.new(status_of_help_params)

    if @status_of_help.save
      render json: @status_of_help, status: :created, location: @status_of_help
    else
      render json: @status_of_help.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status_of_helps/1
  def update
    if @status_of_help.update(status_of_help_params)
      render json: @status_of_help
    else
      render json: @status_of_help.errors, status: :unprocessable_entity
    end
  end

  # DELETE /status_of_helps/1
  def destroy
    @status_of_help.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_of_help
      @status_of_help = StatusOfHelp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_of_help_params
      params.require(:status_of_help).permit(:name)
    end
end
