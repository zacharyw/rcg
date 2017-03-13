module ConversationSteps
  def have_new_form
    have_css "form#new_conversation"
  end

  def write_conversation(text)
    body = find("#editable-body")
    body.set(text)
  end

  def post_conversation
    click_on "Post"
  end
end
