class ProgressCategory < ActiveRecord::Base
  has_many :habits
  has_many :challenges
  has_many :started_habits
  has_many :started_challenges
  has_many :completed_habits
  has_many :completed_challenges
end
