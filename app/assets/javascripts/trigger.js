// TODO: move to library
function trigger(element, event_name) {
  var event = document.createEvent('HTMLEvents');
  event.initEvent(event_name, true, false);
  element.dispatchEvent(event);
}
