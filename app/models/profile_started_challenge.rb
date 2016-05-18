class ProfileStartedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  has_many :started_challenge_updates
end
