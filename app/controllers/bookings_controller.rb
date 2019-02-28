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
    @booking = Booking.new(booking_params)
    @booking.status = "on demand"
    @booking.performance = @performance
    @booking.profile = current_user.profile
    if @booking.save
      redirect_to booking_path(@booking)
    else
      p "Loose"
      render "/performances/#{@performance.id}"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start, :end, :performance_id, :profile_id)
  end
end
