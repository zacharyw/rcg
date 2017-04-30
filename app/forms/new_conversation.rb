class NewConversation
  include ActiveModel::Model

  attr_reader :body, :user

  validates :body, :user, presence: true

  def initialize(body: nil, user: nil)
    @body = body
    @user = user
  end

  # Build a new Conversation object with a single message containing the given body.
  def perform
    conversation = Conversation.new(user: user)
    conversation.messages.build(body: body, user: user)
    
    conversation
  end

  def default_body
    body || 'Write something...'
  end
end
