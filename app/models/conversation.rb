class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages

  after_create :broadcast

  def broadcast
    ConversationChannel.broadcast_to 'conversations', self
  end
end
