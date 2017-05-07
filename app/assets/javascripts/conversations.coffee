$(document).on 'turbolinks:load', ->
  $editableMessageBody = $(".editable-body")
  $editableMessageBody.focus()

  $editableMessageBody.on "click", (event) ->
    $editableMessageBody.tooltip('destroy')

  $editableMessageBody.on "keydown", (event) ->
    $editableMessageBody.tooltip('destroy')

  onSubmit = (placement, event) ->
    event.preventDefault()

    if $editableMessageBody.text().trim().length == 0
      event.preventDefault()
      $editableMessageBody.tooltip({placement: placement, title: 'Your message appears to be blank. Please write something or attach a file.'})
      $editableMessageBody.tooltip('show')
    else
      $(".new-message-body").val($editableMessageBody.text())
      $(".new-message-body").closest('form').trigger('submit.rails')
      $(".new-message-body").empty()
      $editableMessageBody.html('')
                    
  $submitButton = $("#new-message-submit")
  $submitButton.on "click", (event) ->
    onSubmit('bottom', event)

  $newEditableMessage = $(".new-message-editable")
  $newEditableMessage.on "keydown", (event) ->
    if event.which == 13
      onSubmit('top', event)

  $msgSubmitButton = $("#send-btn")
  $msgSubmitButton.on "click", (event) ->
    onSubmit('top', event)

    
    
