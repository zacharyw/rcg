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
    last_read = scope.read_conversations.where(conversation: object).first unless scope.nil?

    count = object.messages.count if last_read.nil?

    count = object.messages.where("created_at > :read_at", {read_at: last_read.read_at}).count if count.nil?

    count
  end
end
