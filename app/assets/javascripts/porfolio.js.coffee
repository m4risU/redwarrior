jQuery ->
  $('#myCarousel').carousel()
  showSidebar()

  $('#myCarousel').on 'slide', ->
    $('.explanation').fadeOut()

  $('#myCarousel').on 'slid', ->
    showSidebar()

showSidebar = ->
  $('.explanation').fadeIn()
  $('.explanation div').hide()
  $("#" + $('.carousel .active').attr('id') + "_sidebar").show()