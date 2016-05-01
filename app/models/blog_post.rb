class BlogPost < ActiveRecord::Base
  belongs_to :author, class_name: "Profile"

  def parsed_body
    return self.body.split("<PARAGRAPH>")
  end
end
