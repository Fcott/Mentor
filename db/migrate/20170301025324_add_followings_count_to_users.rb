class AddFollowingsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followings_count, :integer, default: 0, null: false

    # User.find_each { |u| User.reset_counters(u.id, :followings) }

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE users
           SET followings_count = (SELECT count(1)
                                   FROM relationships
                                  WHERE relationships.follower_id = users.id)
    SQL
  end
end
