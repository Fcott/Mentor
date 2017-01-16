class AddSavedAtToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :saved_at, :datetime
    add_index :stories, [:user_id, :saved_at]
  end
end
