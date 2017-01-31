class RenameSavesToSavings < ActiveRecord::Migration[5.0]
  def change
    rename_table :saves, :savings
  end
end
