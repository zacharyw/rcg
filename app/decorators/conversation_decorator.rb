class ConversationDecorator < Draper::Decorator
  delegate_all
  
  def preview
    messages.first.body.truncate_at(140)
  end

  def author
    user.username
  end
end
