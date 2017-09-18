initRippleEffect = () ->
  $('[data-ripple]').click (event) ->
    $element = $(this)
    $element.find('.ripple').remove()
    $ripple = $('<div/>', class: 'ripple')
    offset = $element.offset()
    size = Math.max($element.outerWidth(), $element.outerHeight());
    x = event.pageX - offset.left - size/2;
    y = event.pageY - offset.top - size/2;
    
    $ripple.css(
      height: size
      width: size
      top: y + 'px'
      left: x + 'px'
    )

    $element.append $ripple

$ ->
  initRippleEffect()
