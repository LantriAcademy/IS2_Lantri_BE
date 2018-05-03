class FoundationsController < ApplicationController
  acts_as_token_authentication_handler_for Director, only: [:create, :update]

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
      director = Director.find(@foundation.director_id)
      director.foundation_id = @foundation.id
      director.save
      render json: @foundation, status: :created, location: @foundation
    else
      render json: @foundation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foundations/1
  def update
    if @foundation.update(foundation_params)
      render json: @foundation, status: :ok
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
  
  def foundation_size
    @size = Foundation.ActualSize()
    render json: @size
  end
  
  def foundation_age_stats
    @arr = Foundation.GetFundationNumberBenefi(params[:min],params[:max],params[:id])
    render json: @arr
  end

  def years_event
    arr = Foundation.GetYearsEvent(params[:id])
    render json: arr
  end
  
  def years_event_data
    arr = Foundation.GetYearsEventData(params[:year],params[:id])
    render json: arr
  end

  #def foundation_benefiteds
   # @benefiteds  = Foundation.GetBenefiteds(params[:id])
    #render json: @benefiteds
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def foundation_params
      params.require(:foundation).permit(:name, :direction, :latitude, :longitude, :director_id, :avatar)
    end
end
