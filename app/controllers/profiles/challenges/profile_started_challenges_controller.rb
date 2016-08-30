class Profiles::Challenges::ProfileStartedChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_started_challenges, only: :index
  before_action :get_profile_started_challenge, only: :show

  def index
  end

  def create
    create_profile_started_challenge(profile_started_challenge_params)
  end

  def show
  end

  private
  def profile_started_challenge_params
    params.require(:profile_started_challenge).permit(:challenge_id, :progress_category).merge(profile_id: @profile.id)
  end

  def create_profile_started_challenge(params)
    @profile_started_challenge = ProfileStartedChallenge.new(params)
    if @profile_started_challenge.save
      flash[:success] = "Good luck!"
      redirect_to profile_profile_started_challenges_path(@profile.id)
    else
      flash[:error] = @profile_started_challenge.errors
      redirect_to :back
    end 
  end

  def get_profile_started_challenges
    @profile_started_challenges = @profile.profile_started_challenges
  end

  def get_profile_started_challenge
    @profile_started_challenge = ProfileStartedChallenge.find(params[:id])
  end
end
