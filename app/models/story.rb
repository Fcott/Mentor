class Story < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
  scope :drafts, -> { where(draft: true)  }
  scope :published, -> { where(draft: false) }
  scope :order_by_published, -> { reorder(published_at: :desc)  }
  scope :selected_users, -> (users){ where('user = ?', users) }
  attachment :cover_image

  belongs_to :user
  has_many :savings
  has_many :saved_users, through: :savings, source: :user
  has_many :likes
  has_many :notifications, as: :notifiable

  def as_draft
    update_attributes!(draft: true)
  end

  def publish
    update_attributes!(draft: false, published_at: Time.now)
  end

end
