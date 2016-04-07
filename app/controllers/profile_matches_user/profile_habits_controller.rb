class ProfileMatchesUser::ProfileHabitsController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  before_action :get_profile_habit, except: [:index, :create]
  before_action :get_habit, except: [:index, :create]

  def index
  end

  def create
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
    params.require(:profile_habit).permit(:profile_id, :habit_id, :progress_category)
  end

  def create_profile_habit(params)
    binding.pry
    @profile_habit = ProfileHabit.new(params)
    if @profile_habit.save
      habit = @profile_habit.habit
      @profile_habit.update(completed: false)
      @profile.newsfeed_items.create(source_id: @profile.id, header: "Started Habit: #{habit.title}", content: "#{@profile.first_name} is working on their #{@profile_habit.progress_category.downcase} through the #{habit.title.downcase} habit!")
      @profile.post_to_followers("Started Habit: #{habit.title}", "#{@profile.first_name} is working on their #{@profile_habit.progress_category.downcase} through the #{habit.title.downcase} habit!")
      flash[:success] = "good luck, have fun!"
      redirect_to profile_profile_habit_path(profile_id: @profile.id, id: @profile_habit.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end 
end
