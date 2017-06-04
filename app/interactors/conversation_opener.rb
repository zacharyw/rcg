class ConversationOpener
  attr_reader :id, :user
  
  def initialize(id:, user:)
    @id = id
    @user = user
  end
  
  def perform
    conversation = Conversation.where(id: id).includes(messages: [:user]).first

    mark_read(conversation)

    conversation
  end

  private
  def mark_read(conversation)
    last_read = ReadConversation.find_or_initialize_by(user: user, conversation: conversation)
    last_read.read_at = DateTime.now
    last_read.save!
  end
end
