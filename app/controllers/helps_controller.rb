class HelpsController < ApplicationController
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

    if @help.save
      render json: @help, status: :created, location: @help
    else
      render json: @help.errors, status: :unprocessable_entity
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
      params.require(:help).permit(:description, :startDate)
    end
end
