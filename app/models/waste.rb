class Waste < ActiveRecord::Base
  belongs_to :footprint

  @@recyclables = [:glass, :metal, :plastic, :newspaper, :magazines]
  @@recyclables.each do |recyclable|
    validates recyclable, inclusion: {in: [true, false], 
      message: "Please select yes or no"}
  end

  def calculate_emissions
    emissions = 58
    emissions -= 7 if self.metal
    emissions -= 3 if self.plastic
    emissions -= 2 if self.glass
    emissions -= 9 if self.newspaper
    emissions -= 2 if self.magazines
    return emissions
  end

  def recycled_list
    recycle_options = ["glass", "metal", "plastic", "newspaper", "magazines"]
    recycled = []
    recycle_options.each do |item| 
      if self[item]
        recycled.push(item)
      end
    end
    return recycled.join(" ")
  end

end
