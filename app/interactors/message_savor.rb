class MessageSavor
  attr_reader :message
  
  def initialize(body:, conversation_id:, user:)
    @message = Message.new(body: body, conversation_id: conversation_id, user: user)
  end

  def perform
    message.save

    message
  end
end
