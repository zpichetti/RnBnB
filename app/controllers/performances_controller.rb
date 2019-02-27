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

  def performances_available?
    @available_performances = []
    Performance.all.each do |perf|
      @available_performances << perf if perf.bookings.any?
    end
    @available_performances = @available_performances << Performance.join(:bookings).where(status: "performed")
  end
  
  private

  def performance_params
    params.require(:performance).permit(:title, :description, :image_url, :category_id, :performance_date_id, :profile_id, :start_date, :end_date)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
