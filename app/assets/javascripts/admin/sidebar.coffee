$ ->
  $('#side-menu').metisMenu()
  return
#Loads the correct sidebar on window load,
#collapses the sidebar on window resize.
# Sets the min-height of #page-wrapper to window size
$ ->
  $(window).bind 'load resize', ->
    topOffset = 50
    width = if @window.innerWidth > 0 then @window.innerWidth else @screen.width
    if width < 768
      $('div.navbar-collapse').addClass 'collapse'
      topOffset = 100
      # 2-row-menu
    else
      $('div.navbar-collapse').removeClass 'collapse'
    height = (if @window.innerHeight > 0 then @window.innerHeight else @screen.height) - 1
    height = height - topOffset
    if height < 1
      height = 1
    if height > topOffset
      $('#page-wrapper').css 'min-height', height + 'px'
    return
  url = window.location
  # var element = $('ul.nav a').filter(function() {
  #     return this.href == url;
  # }).addClass('active').parent().parent().addClass('in').parent();
  element = $('ul.nav a').filter(->
    @href == url
  ).addClass('active').parent()
  loop
    if element.is('li')
      element = element.parent().addClass('in').parent()
    else
      break
  return