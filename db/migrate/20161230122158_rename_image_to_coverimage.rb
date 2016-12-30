class RenameImageToCoverimage < ActiveRecord::Migration[5.0]
  def change
    rename_column :stories, :image, :cover_image
  end
end
