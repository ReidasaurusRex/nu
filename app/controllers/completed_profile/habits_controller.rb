class CompletedProfile::HabitsController < Inheritance::CompletedProfileController
  before_action :get_profile_from_profile_id

  def index
    @habits = Habit.all
  end

  def show
    @habit = Habit.find(params[:id])
  end

end
