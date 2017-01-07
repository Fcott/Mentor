class CreateSaves < ActiveRecord::Migration[5.0]
  def change
    create_table :saves do |t|
      t.references :user, null:false
      t.references :story, null:false
      t.timestamps null: false
    end

    # add_index :saves, :user_id
    # add_index :saves, :story_id
  end
end
