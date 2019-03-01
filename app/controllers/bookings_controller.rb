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
      redirect_to profile_path(current_user.profile,"3")
    else
      p "Loose"
      render "/performances/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    page = "1"
    if @booking.status == "cancelled by user" || @booking.status == "payed" || @booking.status == "performed"
      page = "3"
    elsif @booking.status == "refused" || @booking.status == "waiting for payment" || @booking.status == "cancelled by performer"
      page = "2"
    end
    redirect_to profile_path(current_user.profile, page)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start, :end, :performance_id, :profile_id)
  end
end
