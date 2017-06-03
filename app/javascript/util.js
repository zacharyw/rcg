export function trigger(element, event_name) {
  var event = document.createEvent('HTMLEvents');
  event.initEvent(event_name, true, false);
  element.dispatchEvent(event);
}

export function outerHeight(el) {
  var height = el.offsetHeight;
  var style = getComputedStyle(el);

  height += parseInt(style.marginTop) + parseInt(style.marginBottom);

  return height;
}
