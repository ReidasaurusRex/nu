class Profiles::Challenges::ProfileCompletedChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_completed_challenges, only: :index
  before_action :get_profile_started_challenge, only: [:new, :create]
  before_action :get_profile_completed_challenge, only: [:show, :edit, :update]

  def index
  end

  def new
    @profile_completed_challenge = ProfileCompletedChallenge.new
  end

  def create
    create_profile_completed_challenge(new_profile_completed_challenge_params)
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

  def get_profile_started_challenge
    @profile_started_challenge = ProfileStartedChallenge.find(params[:profile_started_challenge_id])
  end

  def get_profile_completed_challenge
    @profile_completed_challenge = ProfileCompletedChallenge.find(params[:id])
  end

  def new_profile_completed_challenge_params
    params.require(:profile_completed_challenge).permit(:entry).merge(profile_id: @profile.id, challenge_id: @profile_started_challenge.challenge_id, progress_category: @profile_started_challenge.progress_category, average_difficulty: @profile_started_challenge.average_difficulty)
  end

  def update_profile_completed_challenge_params
    params.require(:profile_completed_challenge).permit(:entry)
  end

  def create_profile_completed_challenge(params)
    @profile_completed_challenge = ProfileCompletedChallenge.new(params)
    if @profile_completed_challenge.save
      flash[:success] = "Great work!"
      @profile_started_challenge.destroy
      redirect_to profile_profile_completed_challenge_path(profile_id: @profile.id, id: @profile_completed_challenge.id)
    else
      render :new
    end
  end
end
