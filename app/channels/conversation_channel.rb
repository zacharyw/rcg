class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation:conversations"
  end
end
