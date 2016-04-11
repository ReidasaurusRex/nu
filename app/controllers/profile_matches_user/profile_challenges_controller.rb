class ProfileMatchesUser::ProfileChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  before_action :get_profile_challenges, only: :index
  before_action :get_unstarted_habits, only: :index
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
    @profile_habits = Hash.new
    @profile_habits[:started] = @profile.profile_challenges.where(completed: false)
    @profile_habits[:completed] = @profile.profile_habits.where(completed: true)
    return @profile_habits    
  end

  def get_unstarted_challenges
    @unstarted_challenges = Challenge.all - @profile.challenges
  end

end
