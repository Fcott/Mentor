class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates :user, presence: true
  validates :story, presence: true
  validates :user_id, uniqueness: { scope: :story_id }
end
