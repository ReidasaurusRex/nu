class ProfileMatchesUser::ProfileChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  before_action :get_habits, only: :index
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
  def get_habits
    @habits = Hash.new
    @habits[:started] = @profile.profile_habits.where(completed: false).map{|ph|ph.habit}
    @habits[:completed] = @profile.profile_habits.where(completed: true).map{|ph|ph.habit}
    @habits[:new] = Habit.all - @profile.habits
    return @habits    
  end

end
