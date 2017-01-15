class AddPublishedatToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :published_at, :datetime
    add_index :stories, [:user_id, :published_at]
  end
end
