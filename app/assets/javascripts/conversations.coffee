$ ->
  $newConversationBody = $("#editable-body")

  $newConversationBody.on "click", (event) ->
    $newConversationBody.tooltip('destroy')

    if $newConversationBody.text().trim() == 'Write something...'
      $newConversationBody.empty()

  $submitButton = $("#new-conversation-submit")
  $submitButton.on "click", (event) ->
    if $newConversationBody.text().trim().length == 0
      event.preventDefault()
      $newConversationBody.tooltip({placement: 'bottom', title: 'Your conversation appears to be blank. Please write something or attach a file.'})
      $newConversationBody.tooltip('show')
    else
      $("#conversation_body").val($newConversationBody.text())
      $newConversationBody.text('Write something...')
      $("#conversation_body").empty()
