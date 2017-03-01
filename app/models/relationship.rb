class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User
  belongs_to :followed, class_name: User
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create  :update_follows
  after_destroy :update_follows


private
  def update_follows
    self.follower.followings_count = self.follower.followings.count
    self.followed.followers_count = self.followed.followers.count
    follower.save
    followed.save
  end
end
