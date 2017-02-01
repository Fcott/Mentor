class RemoveIndexOfSaveByName < ActiveRecord::Migration[5.0]
  def change
    remove_index :stories, name: :index_stories_on_user_id_and_saved_at if index_exists?(:stories, name: :index_stories_on_user_id_and_saved_at)
  end
end
