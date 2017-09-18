$ ->
  $toggle_btn = $('[data-toggle="navigation"]')
  $toggle_target = $('.navigation')
  $toggle_btn.on "click", ->
    if $toggle_target.hasClass('left-slide-in')
      $toggle_target.toggleClass('left-slide-out left-slide-in')
    else if $toggle_target.hasClass('left-slide-out')
      $toggle_target.toggleClass('left-slide-in left-slide-out')
    else
      $toggle_target.toggleClass('left-slide-out')

