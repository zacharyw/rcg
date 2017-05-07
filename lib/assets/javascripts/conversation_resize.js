// TODO: Upgrade to ES6, put this in a class
resizeTimer = null;

resizeFunction = function() {
  height = $(window).height() - $(".navbar-static-top").outerHeight(true) - $("#new-message-form").outerHeight(true);

  $messages = $(".messages");
  if(height !== $messages.height()) {
    $messages.height(height);
  }
};

$(window).resize(function() {
  clearTimeout(resizeTimer);
  resizeTimer = setTimeout(resizeFunction, 100);
});
