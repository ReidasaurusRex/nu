class ProfileChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge 
  belongs_to :progress_category
end
