class ConversationOpener
  attr_reader :id, :user
  
  def initialize(id:, user:)
    @id = id
    @user = user
  end
  
  def perform
    conversation = Conversation.where(id: id).includes(messages: [:user]).first

    ConversationReadMarker.new(conversation: conversation, user: user).perform

    conversation
  end
end
