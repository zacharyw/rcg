// TODO: Upgrade to ES6, put this in a class
resizeTimer = null;

resizeFunction = function() {
  form = $.one("#new-message-form");
  
  if(form === undefined) {
    return;
  }

  height = window.innerHeight - outerHeight(form) - outerHeight($.one('.navbar-static-top'));

  alert = $.one('.alert');
  if(alert) {
    height = height - outerHeight(alert);
  }

  $messages = $.one(".messages");
  if(height !== $messages.offsetHeight) {
    $messages.style.height = height + "px";
  }
};

document.addEventListener('turbolinks:load', function() {
  resizeFunction();
});

window.addEventListener('resize', function() {
  clearTimeout(resizeTimer);
  resizeTimer = setTimeout(resizeFunction, 100);
});

//TODO: move to library
function outerHeight(el) {
  var height = el.offsetHeight;
  var style = getComputedStyle(el);

  height += parseInt(style.marginTop) + parseInt(style.marginBottom);
  return height;
}
