class ConversationSerializer < ActiveModel::Serializer
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  attributes :id, :preview, :author, :time_ago, :url, :new_count

  delegate :user, :messages, :created_at, :id, to: :object
  
  def preview
    truncate(messages.first.body, length: 300, escape: false)
  end

  def author
    user.username
  end

  def time_ago
    distance_of_time_in_words(created_at, Time.now)
  end

  def url
    conversation_path(object)
  end

  def new_count
    NewMessageCounter.new(conversation: object, user: scope).perform
  end
end
