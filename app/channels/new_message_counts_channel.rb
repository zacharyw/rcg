class NewMessageCountsChannel < ApplicationCable::Channel
  def subscribed
    @conversation_id = params[:id]
  end

  periodically every: 15.seconds do
    transmit count: NewMessageCounter.new(conversation: Conversation.find(@conversation_id), user: connection.current_user).perform
  end
end
