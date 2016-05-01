class BlogPost < ActiveRecord::Base
  belongs_to :author, class_name: "Profile"
end
