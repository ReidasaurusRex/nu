class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    create_profile(profile_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :interests, :state).merge(user_id: session[:user_id])
  end

  def create_profile(profile_params)
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:success] = "Cool! Now, let's look at your carbon footprint!"
      redirect_to profile_create_emissions_profile_path(@profile)
    else
      render :new
    end
  end
end
