class HomeEnergy < ActiveRecord::Base
  belongs_to :footprint
  has_many :utilities, dependent: :destroy

  def finished?
    unless self.utilities.empty?
      return self.utilities.all?{|util| util.emissions}
    else
      return true
    end
  end

  def create_utilities(utils)
    self.utilities.each{|util| util.destroy}
    _self = self
    unless utils.empty?
      utils.each do |name, val|
        _self.utilities.create(name: name)
      end
    end
  end
end
