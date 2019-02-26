class PerformancesController < ApplicationController
  def show
    @performance = Perfomance.find(params[:id])
  end
  
  def new
    @performance = Performance.new
    @profile = Profile.new
  end
  
  def create
    @performance = Performance.new(performance_params)
    @profile = Profile.find(params[:id])
    @performance.profile = @profile
    @performance.save
    redirect_to profile_path(@profile)
  end
  
  def edit
  end
  
  def update
  end

  private

  def performance_params
    params.require(:performance).permit(:title, :description, :image_url, :category_id, :performance_date_id, :performer_profile_id)
  end
end
