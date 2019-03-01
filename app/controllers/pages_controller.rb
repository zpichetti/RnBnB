class PagesController < ApplicationController
  def home
    @performances = Performance.where(active: true).where.not(profile_id: current_user.profile.id)
  end
end
