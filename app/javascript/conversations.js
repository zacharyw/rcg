import { outerHeight, trigger } from './util';

let resizeTimer = null;

export function resizeMessages() {
  const form = $.one("#new-message-form");

  if(!form) {
    return;
  }

  let height = window.innerHeight - outerHeight(form) - outerHeight($.one('.navbar-static-top'));

  const alert = $.one('.alert');
  if(alert) {
    height = height - outerHeight(alert);
  }

  const messages = $.one(".messages");
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

  const editableMessageBody = $.one(".editable-body");

  if(!editableMessageBody) {
    return;
  }

  editableMessageBody.focus();

  const onSubmit = function(event) {
    event.preventDefault();
    if(editableMessageBody.textContent.trim().length !== 0) {
      $.one(".new-message-body").value = editableMessageBody.textContent;
      trigger($.one('.message-form'), 'submit');
      $.one(".new-message-body").value = '';
      editableMessageBody.innerHTML = '';
    }
 };

  const submitButton = $.one("#new-message-submit");
  if(submitButton) {
    submitButton.addEventListener("click", onSubmit);
  }

  const newEditableMessage = $.one(".new-message-editable");
  if(newEditableMessage) {
    newEditableMessage.addEventListener("keydown", function(event) {
      if(event.which === 13) {
        onSubmit(event)
      }
    });
  }

  const msgSubmitButton = $.one("#send-btn");
  if(msgSubmitButton) {
    msgSubmitButton.addEventListener("click", onSubmit);
  }
});
