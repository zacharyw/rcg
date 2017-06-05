export function trigger(element, event_name) {
  const event = document.createEvent('HTMLEvents');
  event.initEvent(event_name, true, false);
  element.dispatchEvent(event);
}

export function outerHeight(el) {
  let height = el.offsetHeight;
  const style = getComputedStyle(el);

  height += parseInt(style.marginTop) + parseInt(style.marginBottom);

  return height;
}
