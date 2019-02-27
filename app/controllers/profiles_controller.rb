class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
    @performances = Performance.where(profile_id: @profile.id)
    @nbr_performances = @performances.size
  end

  def distance
    Geocoder::Calculations.distance_between([performance.profile.latitude, performance.profile.longitude], [current_user.profile.latitude, current_user.profile.longitude]
  end 
end
