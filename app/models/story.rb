class Story < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
  scope :drafts, -> { where(draft: true)  }
  scope :published, -> { where(draft: false).reorder(published_at: :desc)  }
  scope :saved_order, -> { reorder(saved_at: :desc)  }
  attachment :cover_image

  belongs_to :user
  has_many :saves, class_name: Save
  has_many :saved_users, through: :saves, source: :user

  def as_draft
    update_attributes!(draft: true)
  end

  def publish
    update_attributes!(draft: false, published_at: Time.now)
  end

  def saved
    update_attributes!(saved_at: Time.now)
  end

  def unsaved
    update_attributes!(saved_at: nil)
  end
end
