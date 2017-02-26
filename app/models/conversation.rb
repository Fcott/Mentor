class Conversation < ApplicationRecord
  has_many :user_conversations
  has_many :users, through: :user_conversations
  has_many :messages, dependent: :destroy

  scope :have_messages, -> { where.not(last_message: nil)  }
  scope :desc_order, -> { order(last_message: :desc)  }

  def self.conversations_for(users)
    ids = users.map(&:id).sort
    between = "ID:#{ids.join(",")}"
    if conversation = where(between: between).first
      conversation
    else
      conversation = new(between: between)
      conversation.users = users
      conversation.save
      conversation
    end
  end


  def the_other_user_of(user)
    other = self.users - [user]
    @the_other = User.find_by(id: other.map(&:id))
  end
end
