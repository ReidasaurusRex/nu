class HomeEnergy < ActiveRecord::Base
  belongs_to :footprint
  has_many :utilities, dependent: :destroy

  
end
