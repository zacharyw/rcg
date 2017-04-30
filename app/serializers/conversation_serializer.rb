class ConversationSerializer < ActiveModel::Serializer
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  attributes :id, :preview, :author, :time_ago, :show_link

  delegate :user, :messages, :created_at, :id, to: :conversation
  
  def preview
    truncate(messages.first.body, length: 300)
  end

  def author
    user.username
  end

  def time_ago
    distance_of_time_in_words(created_at, Time.now)
  end

  def conversation
    object
  end

  def show_link
    link_to preview, conversation_path(conversation)
  end
end
