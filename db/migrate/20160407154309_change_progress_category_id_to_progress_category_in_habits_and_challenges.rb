class ChangeProgressCategoryIdToProgressCategoryInHabitsAndChallenges < ActiveRecord::Migration
  def change
    remove_column :habits, :progress_category_id
    remove_column :challenges, :progress_category_id
    remove_column :profile_habits, :progress_category_id

    add_column :habits, :progress_category, :string
    add_column :challenges, :progress_category, :string
    add_column :profile_habits, :progress_category, :string
  end
end
