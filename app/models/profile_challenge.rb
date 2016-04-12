class ProfileChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  def start_date
    self.created_at.strftime("%A %B %d")
  end 
end
