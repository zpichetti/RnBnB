class PagesController < ApplicationController
  def home
    @performances = Performance.all
  end
end
