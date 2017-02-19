class ConversationPresenter
  include ActionView::Helpers
  
  attr_reader :conversation
  
  delegate :user, :messages, :created_at, to: :conversation

  def initialize(conversation)
    @conversation = conversation
  end

  def preview
    truncate(messages.first.body, length: 300)
  end

  def author
    user.username
  end

  def time_ago
    distance_of_time_in_words(created_at, Time.now)
  end
end
