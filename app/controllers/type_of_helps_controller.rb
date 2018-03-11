class TypeOfHelpsController < ApplicationController
  before_action :set_type_of_help, only: [:show, :update, :destroy]

  # GET /type_of_helps
  def index
    @type_of_helps = TypeOfHelp.all

    render json: @type_of_helps
  end

  # GET /type_of_helps/1
  def show
    render json: @type_of_help
  end

  # POST /type_of_helps
  def create
    @type_of_help = TypeOfHelp.new(type_of_help_params)

    if @type_of_help.save
      render json: @type_of_help, status: :created, location: @type_of_help
    else
      render json: @type_of_help.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_of_helps/1
  def update
    if @type_of_help.update(type_of_help_params)
      render json: @type_of_help
    else
      render json: @type_of_help.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_of_helps/1
  def destroy
    @type_of_help.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_help
      @type_of_help = TypeOfHelp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_of_help_params
      params.require(:type_of_help).permit(:name)
    end
end
