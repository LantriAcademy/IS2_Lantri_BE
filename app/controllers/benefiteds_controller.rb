class BenefitedsController < ApplicationController
  acts_as_token_authentication_handler_for Director, only: [:create]
  before_action :set_benefited, only: [:show, :update, :destroy]

  # GET /benefiteds
  def index
    @benefiteds = Benefited.all

    render json: @benefiteds
  end

  # GET /benefiteds/1
  def show
    render json: @benefited
  end

  # POST /benefiteds
  def create
    @benefited = Benefited.new(benefited_params)
    foundation = Foundation.find(@benefited.foundation_id)
    director = Director.find(foundation.director_id)
    if director.authentication_token == params[:director_token]
      if @benefited.save 
        render json: @benefited, status: :created, location: @benefited
      else
        render json: @benefited.errors, status: :unprocessable_entity
      end
    else
      render json: {"error": "unauthorized"}, status: :unauthorized
    end
   
  end

  # PATCH/PUT /benefiteds/1
  def update
    if @benefited.update(benefited_params)
      render json: @benefited
    else
      render json: @benefited.errors, status: :unprocessable_entity
    end
  end

  # DELETE /benefiteds/1
  def destroy
    @benefited.destroy
  end

  def benefitedsfoundation_page
      @benefiteds  = Benefited.GetBeneficiedFoundationPage(params[:page],params[:foundation_id])
      render json: @benefiteds
  end
  
  def benefitedsfoundation_size
    @size = Benefited.BeneficiedFoundationActualSize(params[:foundation_id])
    render json: @size
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefited
      @benefited = Benefited.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def benefited_params
      params.require(:benefited).permit(:name,:age, :preferences,:foundation_id)
    end
end
