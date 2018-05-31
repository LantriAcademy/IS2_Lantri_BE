class EvidencesController < ApplicationController
  before_action :set_evidence, only: [:show, :update, :destroy]

  # GET /evidences
  def index
    @evidences = Evidence.all

    render json: @evidences
  end

  # GET /evidences/1
  def show
    render json: @evidence
  end

  # POST /evidences
  def create
    @evidence = Evidence.new(evidence_params)

    if @evidence.save
      render json: @evidence, status: :created, location: @evidence
    else
      render json: @evidence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evidences/1
  def update
    if @evidence.update(evidence_params)
      render json: @evidence
    else
      render json: @evidence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evidences/1
  def destroy
    @evidence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence
      @evidence = Evidence.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def evidence_params
      params.require(:evidence).permit(:description, :avatar)
    end
end
