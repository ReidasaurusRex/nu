class AddDescriptionToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :description, :string
  end
end
