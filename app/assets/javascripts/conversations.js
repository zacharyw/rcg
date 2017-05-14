var resizeTimer = null;

function resizeMessages() {
  var form = $.one("#new-message-form");

  if(!form) {
    return;
  }

  var height = window.innerHeight - outerHeight(form) - outerHeight($.one('.navbar-static-top'));

  var alert = $.one('.alert');
  if(alert) {
    height = height - outerHeight(alert);
  }

  var messages = $.one(".messages");
  if(height !== messages.offsetHeight) {
    messages.style.height = height + "px";
  }
}

window.addEventListener('resize', function() {
  clearTimeout(resizeTimer);
  resizeTimer = setTimeout(resizeMessages, 50);
});

document.addEventListener('turbolinks:load', function() {
  resizeMessages();

  var editableMessageBody = $.one(".editable-body");

  if(!editableMessageBody) {
    return;
  }

  editableMessageBody.focus();

  var onSubmit = function(event) {
    event.preventDefault();
    if(editableMessageBody.textContent.trim().length !== 0) {
      $.one(".new-message-body").value = editableMessageBody.textContent;
      trigger($.one('.message-form'), 'submit');
      $.one(".new-message-body").value = '';
      editableMessageBody.innerHTML = '';
    }
 };

  var submitButton = $.one("#new-message-submit");
  if(submitButton) {
    submitButton.addEventListener("click", onSubmit);
  }

  var newEditableMessage = $.one(".new-message-editable");
  if(newEditableMessage) {
    newEditableMessage.addEventListener("keydown", function(event) {
      if(event.which === 13) {
        onSubmit(event)
      }
    });
  }

  var msgSubmitButton = $.one("#send-btn");
  if(msgSubmitButton) {
    msgSubmitButton.addEventListener("click", onSubmit);
  }
});
