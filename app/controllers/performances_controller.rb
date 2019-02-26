class PerformancesController < ApplicationController
  before_action :find_profile, only: [ :new, :create ]
  
  def show
  end
  
  def new
    @performance = Performance.new
  end
  
  def create
    @performance = Performance.new(performance_params)
    @performance.profile = @profile
    @performance.performance_date = PerformanceDate.last
    @performance.save
    redirect_to root_path
  end
  
  def edit
  end
  
  def update
  end

  private

  def performance_params
    params.require(:performance).permit(:title, :description, :image_url, :category_id, :performance_date_id, :profile_id, :start_date, :end_date)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
