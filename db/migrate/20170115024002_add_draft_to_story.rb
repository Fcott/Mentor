class AddDraftToStory < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :draft, :boolean, default: true
  end
end
