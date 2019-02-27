class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
    @performances = Performance.where(profile_id: @profile.id)
    @nbr_performances = @performances.size
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
