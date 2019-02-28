class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile

    # recuperation des performances prose par le current user
    @performances = Performance.where(profile_id: @profile.id)
    @nbr_performances = @performances.size

    # recuperation des bookings pour le current user
    @performances_booked = 0
    @nbr_perf_a_faire = nbr_perf_a_faire(@performances)

    # recuperation des bookings faite par le current user
    @my_booking = Booking.where(profile_id: @profile.id)
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

  def nbr_perf_a_faire(performances)
    nbr = 0
    performances.each do |performance|
      nbr += performance.booking.size
    end
    return nbr
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :address, :address_city, :address_zipcode, :address_country, :performer_description, :avatar_url)
  end
end
