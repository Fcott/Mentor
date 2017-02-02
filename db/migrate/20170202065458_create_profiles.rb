class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.text :self_introduction
      t.text :interest
      t.text :education
      t.text :work_experience
      t.text :languages
      t.text :others

      t.timestamps
    end
  end
end
