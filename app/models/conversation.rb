class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages

  after_create :broadcast

  def broadcast
    if self.messages.size > 0
      ConversationChannel.broadcast_to 'conversations', ActiveModelSerializers::SerializableResource.new(self).to_json
    end
  end
end
