class Story < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
  attachment :cover_image

  belongs_to :user
  has_many :saves
  has_many :saved_users, through: :saves, source: :user
end
