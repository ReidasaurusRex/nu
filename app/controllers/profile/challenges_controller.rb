class ProfileMatchesUser::ChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_challenge, only: :show
  before_action :ensure_profile_without_challenge, only: :show
  
  def index
  end

  def show
  end
  
  private
  def get_challenge
    @challenge = Challenge.find(params[:id])
  end

  def ensure_profile_without_challenge
    if @profile.challenges.include?(@challenge)
      redirect_to profile_profile_challenge_path(profile_id: @profile.id, id: @challenge.id)
    end
  end
end