module ConversationSteps
  def have_new_form
    have_css "form#new_conversation"
  end

  def post_conversation(text)
    set_text(text)
    click_on "Post"
  end

  def send_message(text)
    set_text(text).native.send_keys(:return)
  end

  private
  def set_text(text)
    body = find(".editable-body")
    body.set(text)
    body
  end
end
