class PagesController < ApplicationController
  def home
    @performances = Performance.where(profile_id: current_user.profile.id)
  end
end
