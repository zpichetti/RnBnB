class PagesController < ApplicationController
  def home
<<<<<<< HEAD
    if params[:query].present?
=======
    if user_signed_in?
      @performances = Performance.where(active: true).where.not(profile_id: current_user.profile.id)
    else
      @performances = Performance.where(active: true)
    end
>>>>>>> 5a733b635bf8708f301cdfabf823181334e522bd
    @performances = Performance.where(active: true)
  end
ends


def index
  if params[:query].present?
    sql_query = "title ILIKE :query OR description ILIKE :query"
    @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
  else
    @movies = Movie.all
  end
end