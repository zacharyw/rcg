class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :user, :conversation, presence: true

  after_create :broadcast

  private
  def broadcast
    MessagesChannel.broadcast_to conversation, ActiveModelSerializers::SerializableResource.new(self).to_json
  end
end
