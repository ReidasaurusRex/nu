class ProfileChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge
end
