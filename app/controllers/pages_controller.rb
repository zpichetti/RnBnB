class PagesController < ApplicationController
  def home
    if user_signed_in?
      @performances = Performance.where(active: true).where.not(profile_id: current_user.profile.id)
    else
      @performances = Performance.where(active: true)
    end
    @performances = Performance.where(active: true)
  end
end
