class Habit < ActiveRecord::Base
  has_many :started_habits
  has_many :completed_habits
  belongs_to :progress_category
end
