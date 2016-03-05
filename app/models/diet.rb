class Diet < ActiveRecord::Base
  belongs_to :footprint

  validates :diet_type, inclusion: {in: %w(typical meat_heavy no_beef pescatarian vegetarian vegan), 
    message: "Please select one of the below options"}

  def calculate_emissions
    case self.diet_type
    when "typical"
      return 685
    when "meat_heavy"
      return 868
    when "no_beef"
      return 451
    when "pescatarian"
      return 612
    when "vegetarian"
      return 420
    when "vegan"
      return 246
    end
  end
end
