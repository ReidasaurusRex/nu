class ProfileCompletedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge
end
