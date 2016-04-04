class ProfileHabit < ActiveRecord::Base
  belongs_to :profile
  belongs_to :habit 
  belongs_to :progress_category

  def completion_date
    return self.updated_at.strftime("%B %e, %Y")
  end

  def start_date
    return self.created_at.strftime("%B %e, %Y")
  end
end
