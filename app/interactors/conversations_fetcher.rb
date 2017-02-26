class ConversationsFetcher
  def perform
    Conversation.all.order(created_at: :desc)
  end
end
