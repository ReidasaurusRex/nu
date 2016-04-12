class ProfileMatchesUser::ProfileChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  before_action :get_profile_challenges, only: :index
  before_action :get_unstarted_challenges, only: :index
  def index
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def get_profile_challenges
    @profile_challenges = Hash.new
    @profile_challenges[:started] = @profile.profile_challenges.where(completed: false)
    @profile_challenges[:completed] = @profile.profile_challenges.where(completed: true)
    return @profile_habits    
  end

  def get_unstarted_challenges
    @unstarted_challenges = Challenge.all - @profile.challenges
  end

  def profile_challenge_params
    params.require(:profile_challenge).permit(:challenge_id, :progress_category).merge(profile_id: @profile.id)
  end

end
