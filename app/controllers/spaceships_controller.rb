class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  # before_action :set_booking, only: %i[new create]

  def index
    if params[:planet].present?
      @spaceships = Spaceship.where(planet: params[:planet])
    elsif params[:query].present?
      @spaceships = Spaceship.search_by_name_and_planet(params[:query])
    elsif params[:min_price].present?
      @spaceships = Spaceship.where("price_per_day BETWEEN ? AND ?" , "#{params[:min_price].to_i}", "#{params[:max_price].to_i}")
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @booking = Booking.new
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

  def destroy
    @spaceship = Spaceship.find(params[:id])
    @spaceship.destroy
    redirect_to spaceships_path, status: :see_other
  end

  def edit
    @spaceship = Spaceship.find(params[:id])
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :photo, :description, :number_of_passenger, :price_per_day, :planet)
  end
end
