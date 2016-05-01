class ChangeUserIdToAuthorIdInBlogPosts < ActiveRecord::Migration
  def change
    rename_column :blog_posts, :user_id, :author_id
  end
end
