class ProgressCategory < ActiveRecord::Base
  has_many :habits
  has_many :challenges
  has_many :profile_habits
  has_many :profile_challenges
end
