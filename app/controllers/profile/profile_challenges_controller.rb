class Profile::ProfileChallengesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_from_profile_id
  before_action :get_profile_challenges, only: :index
  before_action :get_unstarted_challenges, only: :index
  before_action :get_profile_challenge, except: [:index, :create]
  def index
  end

  def create
    create_profile_challenge(profile_challenge_params)
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
    return @profile_challenges    
  end

  def get_unstarted_challenges
    @unstarted_challenges = Challenge.all - @profile.challenges
  end

  def get_profile_challenge
    @profile_challenge = ProfileChallenge.find(params[:id])
  end

  def profile_challenge_params
    params.require(:profile_challenge).permit(:challenge_id, :progress_category).merge(profile_id: @profile.id)
  end

  def create_profile_challenge(params)
    @profile_challenge = ProfileChallenge.new(params)
    if @profile_challenge.save
      challenge = @profile_challenge.challenge
      @profile_challenge.update(completed: false)
      @profile.newsfeed_items.create(source_id: @profile.id, header: "Started Challenge: #{challenge.title.capitalize}", content: "#{@profile.first_name.capitalize} is working on their #{@profile_challenge.progress_category} through the #{challenge.title.downcase} challenge!")
      @profile.post_to_followers("Started Challenge: #{challenge.title.capitalize}", "#{@profile.first_name.capitalize} is working on their #{@profile_challenge.progress_category} through the #{challenge.title.downcase} challenge!") if @profile.sharing_setting.improvements
      flash[:success] = "good luck!"
      redirect_to profile_profile_challenge_path(profile_id: @profile.id, id: @profile_challenge.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end
end
