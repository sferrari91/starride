class BookingsController < ApplicationController
  before_action :set_spaceship, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @spaceship = @booking.spaceship
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.active!
    @booking.save
    redirect_to dashboard_path
  end

  def decline_booking
    @booking = Booking.find(params[:id])
    @booking.archived!
    @booking.save
    redirect_to dashboard_path
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:spaceship_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :spaceship, :status)
  end

end
