class CreateJobCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :job_categories do |t|
      t.string      :name
      t.references  :parent
      t.timestamps
    end
  end
end
