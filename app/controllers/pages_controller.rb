class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @spaceship = Spaceship.new
    @spaceship = Spaceship.where(params[:planet])
    if params[:query].present?
      @spaceships = Spaceship.search_by_name_and_planet(params[:query])
    else
      @spaceships = Spaceship.all
    end
  end

end
