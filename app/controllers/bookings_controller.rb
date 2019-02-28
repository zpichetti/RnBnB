class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @performance = Performance.find(params[:performance_id])
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @booking = Booking.new(status: "On demande")
    @booking.performance = @performance
    @booking.profile = current_user.profile
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.statut = booking_params.status
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start, :end)
  end
end
