class PerformanceDatesController < ApplicationController

  def new
    @performance = Performance.find(params[:performance_id])
    @performance_date = PerformanceDate.new
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @performance_date = PerformanceDate.new
    redirect_to performance_path(@performance.id)
  end

  private

  def performance_date_params
    params.require(:performance_date).permit(:start, :end)
  end
end
