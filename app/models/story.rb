class Story < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
  scope :drafts, -> { where(draft: true)  }
  scope :published, -> { where(draft: false)  }
  attachment :cover_image

  belongs_to :user
  has_many :saves, class_name: Save
  has_many :saved_users, through: :saves, source: :user

  def draft
    update_columns(draft: true)
  end

  def publish
    update_columns(draft: false)
  end
end
