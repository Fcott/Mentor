class RemoveSavedAtFromStories < ActiveRecord::Migration[5.0]
  def change
    remove_column :stories, :saved_at, :datetime
  end
end
