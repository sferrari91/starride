class SpaceshipsController < ApplicationController
  def index
    if params[:planet].present?
      @spaceships = Spaceship.where(planet: params[:planet])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :photo, :description, :number_of_passenger, :price_per_day, :planet)
  end
end
