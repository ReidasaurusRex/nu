class AddProgressCategoryToProfileChallenges < ActiveRecord::Migration
  def change
    add_column :profile_completed_challenges, :progress_category, :string
    add_column :profile_started_challenges, :progress_category, :string
  end
end
