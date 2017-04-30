class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages

  validates :user, presence: true
  validate :at_least_one_message

  after_create :broadcast

  private
  def broadcast
    ConversationChannel.broadcast_to 'conversations', ActiveModelSerializers::SerializableResource.new(self).to_json
  end

  def at_least_one_message
    unless messages.size > 0
      errors.add(:messages, 'must have at least one')
    end
  end
end
