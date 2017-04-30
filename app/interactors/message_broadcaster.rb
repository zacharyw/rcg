class MessageBroadcaster
  attr_reader :message, :conversation
  
  def initialize(message)
    @message = message
    @conversation = message.conversation
  end
  
  def perform
    MessagesChannel.broadcast_to conversation, ActiveModelSerializers::SerializableResource.new(message).to_json
  end
end
