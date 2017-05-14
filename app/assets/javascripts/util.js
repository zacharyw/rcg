function trigger(element, event_name) {
  event = document.createEvent('HTMLEvents');
  event.initEvent(event_name, true, false);
  element.dispatchEvent(event);
}

function outerHeight(el) {
  height = el.offsetHeight;
  style = getComputedStyle(el);

  height += parseInt(style.marginTop) + parseInt(style.marginBottom);

  return height;
}
