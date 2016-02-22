class BetaUser < ActiveRecord::Base
  validates :email, presence: {message: " is required"}
  validates :first_name, presence: {message: " is required"}
  validates :last_name, presence: {message: " is required"}
  validates :email, uniqueness: {message: " has already been used"}
  validates :communicate, inclusion: {in: [*1..10], 
    message: "Please select one through ten"}
  validates :explanation, presence: {message: "Please enter an explanation"}
end
