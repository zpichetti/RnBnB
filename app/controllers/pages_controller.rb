class PagesController < ApplicationController
  def home
    if params[:query].present?
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