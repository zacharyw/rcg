document.addEventListener 'turbolinks:load', ->
  editableMessageBody = $.one(".editable-body")

  if editableMessageBody.length == 0
    return

  editableMessageBody.focus()

  onSubmit = (event) ->
    event.preventDefault()
    if editableMessageBody.textContent.trim().length != 0
      $.one(".new-message-body").value = editableMessageBody.textContent
      trigger($.one('.message-form'), 'submit')
      $.one(".new-message-body").value = ''
      editableMessageBody.innerHTML = ''

  submitButton = $.one("#new-message-submit")
  submitButton?.addEventListener "click", onSubmit

  newEditableMessage = $.one(".new-message-editable")
  newEditableMessage?.addEventListener "keydown", (event) ->
    if event.which == 13
      onSubmit(event)

  msgSubmitButton = $.one("#send-btn")
  msgSubmitButton?.addEventListener "click", onSubmit

    
    
