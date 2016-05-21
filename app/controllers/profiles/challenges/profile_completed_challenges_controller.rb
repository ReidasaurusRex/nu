class Profiles::Challenges::ProfileCompletedChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_completed_challenges, only: :index
  before_action :get_profile_completed_challenge, only: [:show, :edit, :update]

  def index
  end

  def new
    @profile_completed_challenge = ProfileCompletedChallenge.new(profile_completed_challenge_params)
  end

  def create
    binding.pry
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def get_profile_completed_challenges
    @profile_completed_challenges = @profile.profile_completed_challenges
  end

  def get_profile_completed_challenge
    @profile_completed_challenge = ProfileCompletedChallenge.find(params[:id])
  end

  def profile_completed_challenge_params
    params.require(:profile_completed_challenge).permit(:challenge_id, :entry, :average_difficulty, :progress_category).merge(profile_id: @profile.id)
  end
end
