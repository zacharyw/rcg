import { outerHeight } from './util';
import Rails from 'rails-ujs';

let resizeTimer = null;

export function resizeMessages(has_alert = true) {
  const form = $.one("#new-message-form");

  if(!form) {
    return;
  }

  let height = window.innerHeight - outerHeight(form) - outerHeight($.one('.navbar-static-top'));

  const page_alert = $.one('.alert');
  if(has_alert && page_alert) {
    height = height - outerHeight(page_alert);
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

  const page_alert = $.one('.alert');
  if(page_alert) {
    page_alert.addEventListener('closed.bs.alert', function(event) {
      resizeMessages(false);
    }, false);
  }

  const editableMessageBody = $.one(".editable-body");

  if(!editableMessageBody) {
    return;
  }

  editableMessageBody.focus();

  const onSubmit = function(event) {
    event.preventDefault();
    if(editableMessageBody.textContent.trim().length !== 0) {
      $.one(".new-message-body").value = editableMessageBody.textContent;
      const form = document.querySelector('.message-form');
      Rails.fire(form, 'submit');
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
