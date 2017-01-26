class CreateUserJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_jobs do |t|
      t.references :user, foreign_key: true, null: false
      t.references :job_category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
