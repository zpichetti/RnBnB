class ReviewsController < ApplicationController
  def create
    @performance = Performance.find(params[:performance_id])
    @review = Review.new(review_params)
    @review.performance = @performance
    @review.profile = current_user.profile
    @review.save
    redirect_to profile_path(current_user.profile, "3")
  end

  private

  def review_params
    params.require(:review).permit(:note, :content)
  end
end
