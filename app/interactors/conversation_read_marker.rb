class ConversationReadMarker
  attr_reader :conversation, :user

  def initialize(conversation:, user:)
    @conversation = conversation
    @user = user
  end

  def perform
    last_read = ReadConversation.find_or_initialize_by(user: user, conversation: conversation)
    last_read.read_at = DateTime.now
    last_read.save!
  end
end
