class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :stories, [:user_id, :created_at]
  end
end
