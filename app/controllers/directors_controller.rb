class DirectorsController < ApplicationController
  acts_as_token_authentication_handler_for Director, only: [:show,:update]

  before_action :set_director, only: [:show, :update, :destroy]

  # GET /directors
  def index
    @directors = Director.all
    render json: @directors
  end

  # GET /directors/1
  def show
      if Director.where(authentication_token: params[:director_token]).first.id == @director.id
        render json: @director
      else
        render json: @director.errors, status: :unauthorized
      end
  end

  # POST /directors
  def create
    @director = Director.new(director_params)

    if @director.save
      DirectorMailer.welcome_email(@director).deliver_later
      render json: @director, status: :created, location: @director
    else
      render json: @director.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /directors/1
  def update
    if @director.update(director_params)
      render json: @director, status: :ok
    else
      render json: @director.errors, status: :unprocessable_entity
    end
  end

  # DELETE /directors/1
  def destroy
    @director.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_director
      @director = Director.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def director_params
      params.require(:director).permit(:bio, :user, :password, :name, :lastname, :email, :phone, :avatar)
    end
end
