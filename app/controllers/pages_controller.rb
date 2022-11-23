class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @spaceship = Spaceship.new
    @spaceships = Spaceship.all
    @spaceship = Spaceship.where(params[:planet])
  end

end
