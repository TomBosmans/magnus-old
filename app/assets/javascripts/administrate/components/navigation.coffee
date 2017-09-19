# On desktop the navigation will be shown on page load while
# for mobile the navigation is display: none. So there are 4 differant states
# the navigation can be in. Displayed, not displayed, slided in and slided out.
toggleNavigation = ->
  $toggle_target = $('.navigation')
  if $toggle_target.hasClass('left-slide-in')
    $toggle_target.toggleClass('left-slide-out left-slide-in')
  else if $toggle_target.hasClass('left-slide-out')
    $toggle_target.toggleClass('left-slide-in left-slide-out')
  else if $toggle_target.css('display') == 'none'
    $toggle_target.toggleClass('left-slide-in')
  else
    $toggle_target.toggleClass('left-slide-out')

$ ->
  $('[data-toggle="navigation"]').each (index, toggle_btn) ->
    $(toggle_btn).on 'click', ->
      toggleNavigation()
  
  $('.overlay').on 'click', ->
    toggleNavigation()