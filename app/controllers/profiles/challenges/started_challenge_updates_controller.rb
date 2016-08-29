class Profiles::Challenges::StartedChallengeUpdatesController < Inheritance::ProfileMatchesUserController
  before_action :get_profile_started_challenge
  # TODO: ensure started challenge belongs to profile

  def new
    @started_challenge_update = StartedChallengeUpdate.new
  end

  def create
    create_started_challenge_update(started_challenge_update_params)
  end

  private
  def get_profile_started_challenge
    @profile_started_challenge = ProfileStartedChallenge.find(params[:profile_started_challenge_id])
  end

  def started_challenge_update_params
    update_number = @profile_started_challenge.started_challenge_updates.length + 1
    params.require(:started_challenge_update).permit(:difficulty).merge(profile_started_challenge_id: @profile_started_challenge.id, challenge_id: @profile_started_challenge.id, update_number: update_number)
  end

  def create_started_challenge_update(params)
    @started_challenge_update = StartedChallengeUpdate.new(params)
    if @started_challenge_update.save
      flash[:success] = "Sweet! Difficulty: #{@started_challenge_update.difficulty}"
      redirect_to profile_profile_started_challenges_path(@profile.id)
    else
      render :new
    end
  end
end
