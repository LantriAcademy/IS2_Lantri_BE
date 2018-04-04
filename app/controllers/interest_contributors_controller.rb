class InterestContributorsController < ApplicationController
  before_action :set_interest_contributor, only: [:show, :update, :destroy]

  # GET /interest_contributors
  def index
    @interest_contributors = InterestContributor.all

    render json: @interest_contributors
  end

  # GET /interest_contributors/1
  def show
    render json: @interest_contributor
  end

  # POST /interest_contributors
  def create
    @interest_contributor = InterestContributor.new(interest_contributor_params)

    if @interest_contributor.save
      render json: @interest_contributor, status: :created, location: @interest_contributor
    else
      render json: @interest_contributor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interest_contributors/1
  def update
    if @interest_contributor.update(interest_contributor_params)
      render json: @interest_contributor
    else
      render json: @interest_contributor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interest_contributors/1
  def destroy
    @interest_contributor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_contributor
      @interest_contributor = InterestContributor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interest_contributor_params
      params.fetch(:interest_contributor, {})
    end
end
