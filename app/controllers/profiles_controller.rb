class ProfilesController < ApplicationController
  def show
    @review = Review.new
    @profile = current_user.profile
    # recuperation des performances prose par le current user
    @performances = Performance.where(profile_id: @profile.id)
    @nbr_performances = @performances.size

    # recuperation des bookings pour le current user
    # @cocktails = Cocktail.joins(doses: :ingredient).where("ingredients.name LIKE ?", "%#{params[:ingredient].capitalize}%")
    @bookings = Booking.joins("INNER JOIN performances ON performances.id = bookings.performance_id").where("performances.profile_id=?", @profile.id).order(:start)
    @nbr_bookings = @bookings.size

    # recuperation des bookings faite par le current user
    @my_bookings = Booking.where(profile_id: @profile.id)
    @nbr_my_bookings = @my_bookings.size
    if params[:format]
      @page = params[:format]
    else
      if @nbr_performances != 0
        @page = "1"
      else
        @page = "3"
      end
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :address, :address_city, :address_zipcode, :address_country, :performer_description, :avatar_url)
  end
end
