class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id

  def sent_time
    created_at.strftime("%c")
  end

  def self.recent_100
    order(created_at: :desc).limit(100).reverse
  end
end
