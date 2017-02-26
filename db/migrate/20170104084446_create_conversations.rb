class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :between
      t.datetime :last_message

      t.timestamps null: false
    end
  end
end
