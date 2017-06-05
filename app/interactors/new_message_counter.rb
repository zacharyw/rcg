class NewMessageCounter
  attr_reader :conversation, :user
  
  def initialize(conversation:, user:)
    @conversation = conversation
    @user = user
  end

  def perform
    last_read = user.read_conversations.where(conversation: conversation).first unless user.nil?

    return conversation.messages.count if last_read.nil?

    conversation.messages.where("created_at > :read_at", {read_at: last_read.read_at}).count
  end
end
