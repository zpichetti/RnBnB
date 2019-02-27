class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
    @performances = Performance.where(profile_id: @profile.id)
    @nbr_performances = @performances.size
  end
end
