class ProfilesController < Inheritance::LoggedInController
  before_action :get_profile, except: [:new, :create]
  before_action :check_if_existing_profile, only: [:new, :create]

  def new
    @profile = Profile.new
    @new_profile = true
  end

  def create
    create_profile(profile_params)
  end

  def show
  end

  def edit
  end

  def update
    update_profile(profile_params)
  end

  private
  def check_if_existing_profile
    if @user.profile
      redirect_to profile_path(@user.profile)
    end
  end

  def get_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :interests, :state, :profile_photo, :cover_photo).merge(user_id: session[:user_id])
  end

  def create_profile(profile_params)
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_footprints_path(@profile)
    else
      render :new
    end
  end

  def update_profile(profile_params)
    if @profile.update(profile_params)
      flash[:success] = "Thanks!"
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end
end
