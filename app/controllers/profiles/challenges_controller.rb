class Profiles::ChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_available_challenges, only: :index
  before_action :get_challenge, only: :show
  before_action :ensure_profile_without_challenge, only: :show
  
  def index
  end

  def show
  end
  
  private
  def get_available_challenges
    @challenges = Challenge.all - @profile.started_challenges - @profile.completed_challenges
  end
  
  def get_challenge
    @challenge = Challenge.find(params[:id])
  end

  def ensure_profile_without_challenge
    if @profile.started_challenges.include?(@challenge)
      profile_started_challenge_id = @profile.profile_started_challenges.where(challenge_id: @challenge.id)[0].id
      redirect_to profile_profile_started_challenge_path(profile_id: @profile.id, id: profile_started_challenge_id)
    elsif @profile.completed_challenges.include?(@challenge)
      profile_completed_challenge_id = @profile.profile_completed_challenges.where(challenge_id: @challenge.id)[0].id
     redirect_to profile_profile_completed_challenge(path(profile_id: @profile.id, id: profile_completed_challenge_id))
    end
  end
end