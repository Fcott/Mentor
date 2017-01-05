class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :content, :conversation_id, :user_id
  scope :for_display, -> { order(:created_at).last(30) }
  def sent_time
    created_at.strftime("%c")
  end
end
