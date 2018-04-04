class InterestFoundationsController < ApplicationController
  before_action :set_interest_foundation, only: [:show, :update, :destroy]

  # GET /interest_foundations
  def index
    @interest_foundations = InterestFoundation.all

    render json: @interest_foundations
  end

  # GET /interest_foundations/1
  def show
    render json: @interest_foundation
  end

  # POST /interest_foundations
  def create
    @interest_foundation = InterestFoundation.new(interest_foundation_params)

    if @interest_foundation.save
      render json: @interest_foundation, status: :created, location: @interest_foundation
    else
      render json: @interest_foundation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interest_foundations/1
  def update
    if @interest_foundation.update(interest_foundation_params)
      render json: @interest_foundation
    else
      render json: @interest_foundation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interest_foundations/1
  def destroy
    @interest_foundation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_foundation
      @interest_foundation = InterestFoundation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interest_foundation_params
      params.fetch(:interest_foundation, {})
    end
end
