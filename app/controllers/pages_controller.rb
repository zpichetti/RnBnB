class PagesController < ApplicationController
  def home
    if user_signed_in?
      @performances = Performance.where(active: true).where.not(profile_id: current_user.profile.id)
    else
      @performances = Performance.where(active: true)
    end
  end 
end


def index
  if params[:query].present?
    sql_query = "title ILIKE :query OR description ILIKE :query"
    @performances = Performance.where(sql_query, query: "%#{params[:query]}%")
  else
    @performances = Performance.where(active: true)
  end
end