class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @spaceship = Spaceship.new
    @spaceships = Spaceship.all
    @spaceship = Spaceship.where(params[:planet])
  end



#TO HAVE THE FORM TO SELECT A PLANET ON THE HOMEPAGE


  def index
    @spaceships = Spaceship.all
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
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
