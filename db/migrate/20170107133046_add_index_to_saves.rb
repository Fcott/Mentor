class AddIndexToSaves < ActiveRecord::Migration[5.0]
  def change
    add_index :saves, [:user_id, :story_id], unique: true
  end
end
