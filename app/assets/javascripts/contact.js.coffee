jQuery ->
  $("#map-container iframe").width($("#map-container").width())

  $(window).on 'resize', ->
    $("#map-container iframe").width($("#map-container").width())
