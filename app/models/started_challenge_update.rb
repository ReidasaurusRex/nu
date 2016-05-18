class StartedChallengeUpdate < ActiveRecord::Base
  belongs_to :started_challenge
  belongs_to :challenge
end
