class PerformanceDatesController < ApplicationController

  def new
    @performance_date= PerformanceDate.new
  end

end
