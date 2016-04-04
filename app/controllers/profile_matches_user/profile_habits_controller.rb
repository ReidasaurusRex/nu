class ProfileMatchesUser::ProfileHabitsController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  before_action :get_profile_habit, except: :index
  before_action :get_habit, except: :index
  def index
  end

  def create
    binding.pry
    create_profile_habit(profile_habit_params)
  end

  def show
  end

  def update
  end

  private
  def get_profile_habit
    @profile_habit = ProfileHabit.find(params[:id])
  end

  def get_habit
    @habit = @profile_habit.habit
  end

  def profile_habit_params
    params.require(:profile_habit).permit(:profile_id, :habit_id)
  end

  def create_profile_habit(params)
    @profile_habit = ProfileHabit.new(params)
    if @profile_habit.save
      @profile.update(completed: false)
      flash[:success] = "You started #{@profile_habit.habit.title}!"
      redirect_to profile_profile_habit_path(profile_id: @profile.id, id: @profile_habit.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end 
end
