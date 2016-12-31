class RenameCoverImageToCoverImageId < ActiveRecord::Migration[5.0]
  def change
    rename_column :stories, :cover_image, :cover_image_id
  end
end
