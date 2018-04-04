class FoundationsController < ApplicationController
  before_action :set_foundation, only: [:show, :update, :destroy]

  # GET /foundations
  def index
    @foundations = Foundation.all

    render json: @foundations
  end

  # GET /foundations/1
  def show
    render json: @foundation
  end

  # POST /foundations
  def create
    @foundation = Foundation.new(foundation_params)

    if @foundation.save
      render json: @foundation, status: :created, location: @foundation
    else
      render json: @foundation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foundations/1
  def update
    if @foundation.update(foundation_params)
      render json: @foundation
    else
      render json: @foundation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foundations/1
  def destroy
    @foundation.destroy
  end

  def foundation_page
      @foundations  = Foundation.GetFundationPage(params[:page])
      render json: @foundations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def foundation_params
      params.require(:foundation).permit(:name, :direction, :latitude, :longitude)
    end

   

end
