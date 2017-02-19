class Forms::Conversation
  include ActiveModel::Model

  attr_accessor :body

  validates :body, presence: true

  # Build a new Conversation object with a single message containing the given body.
  def perform
    conversation = ::Conversation.new
    conversation.messages.build(body: body)

    conversation
  end

  def default_body
    body || 'Write something...'
  end
end
