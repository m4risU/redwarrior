jQuery ->
  emphasize($('#clickables').children().first().attr('id'))
  $('.clickable').on 'click', ->
    emphasize($(this).attr('id'))

emphasize = (id) ->
  first_elem = $('#clickables').children().first()

  $('#clickables').fadeOut 'slow', ->
    first_elem.removeClass("span4").addClass("span2")
    first_elem.find('img').attr('src', first_elem.attr("small-image"))
    $('#' + id).removeClass("span2").addClass("span4")
    $('#' + id + ' img').attr('src', $('#' + id).attr("big-image"))
    $('#clickables').prepend($('#' + id).detach())
    $('#clickables').fadeIn('slow')
    showSidebar($('#clickables').children().first())

showSidebar = (elem) ->
  $('.explanation').fadeIn()
  $('.explanation div').hide()
  $("#" + elem.attr('id') + "-sidebar").show()