class ReadConversation < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :user, :conversation, :read_at
end
