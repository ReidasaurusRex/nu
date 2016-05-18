class StartedChallengeUpdate < ActiveRecord::Base
  belongs_to :profile_started_challenge
  belongs_to :challenge
end
