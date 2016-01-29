class StartedHabit < ActiveRecord::Base
  belongs_to :profile
  belongs_to :habit 
  belongs_to :progress_category
end
