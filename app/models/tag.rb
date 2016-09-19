class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  validates :name, inclusion: {in: %w(water diet travel waste energy social),
    message: "Invalid tag"}

  fuzzily_searchable :name
end
