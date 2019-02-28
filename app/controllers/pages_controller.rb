class PagesController < ApplicationController
  def home
    @performances = Performance.where(active: true)
  end
end
