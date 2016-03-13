class CompletedProfile::HabitsController < Inheritance::CompletedProfileController
  before_action :get_profile_from_profile_id
  before_action :get_started_habits
  before_action :get_completed_habits
  before_action :get_remaining_habits

  def index
  end

  def show
    @habit = Habit.find(params[:id])
  end

  private
  def get_started_habits
    @started_habits = @profile.started_habits
  end

  def get_completed_habits
    @completed_habits = @profile.completed_habits
  end

  def get_remaining_habits
    total_habits = Habit.all
    if total_habits.empty?
      return @habits = []
    else
      @habits = total_habits.keep_if do |habit|
      !@completed_habits.include?(habit) && !@started_habits.include?(habit)
      end
      return @habits
    end
  end
end
