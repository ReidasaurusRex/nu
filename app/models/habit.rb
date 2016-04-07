class Habit < ActiveRecord::Base
  has_many :started_habits
  has_many :completed_habits
end
