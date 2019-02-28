class PerformancesController < ApplicationController
  before_action :find_profile, only: [ :new, :create]
  
  def show
    @performance = Performance.find(params[:id])
    if user_signed_in?
      @distance = Geocoder::Calculations.distance_between([@performance.profile.latitude, @performance.profile.longitude], [current_user.profile.latitude, current_user.profile.longitude]) 
    else
      @distance = 0
    end
  end
  
  def new
    @performance = Performance.new
  end
  
  def create
    @performance = Performance.new(performance_params)
    @performance.profile = @profile
    @performance.save
    redirect_to profile_path(@profile.id)
  end
  
  def edit
    @performance = Performance.find(params[:id])
  end
  
  def update
    @performance = Performance.find(params[:id])
    @performance.update(performance_params)
    redirect_to profile_path(@performance.profile.id)
  end

  def dates_booked
    @performance = Performance.find(params[:id])
    Booking.where("NOT status = 'performed' AND performance_id = ?", perf.id).pluck(:start, :end)
  end
  
  def toggle
    @performance = Performance.find(params[:id])
    if @performance.active
      @performance.active = false
    else
      @performance.active = true
    end
    @performance.save
    redirect_to profile_path(@performance.profile.id)
  end
  private

  def performance_params
    params.require(:performance).permit(:title, :description, :category_id, :photo, :photo_cache, :performance_date_id, :profile_id, :start_date, :end_date, :hour_price)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
