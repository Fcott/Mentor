class AddLikedCountToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :likes_count, :integer, default: 0, null: false

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE stories
           SET likes_count = (SELECT count(1)
                                   FROM likes
                                  WHERE likes.story_id = stories.id)
    SQL
  end
end
