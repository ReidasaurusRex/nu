class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :completed_challenges
  belongs_to :progress_category
end
