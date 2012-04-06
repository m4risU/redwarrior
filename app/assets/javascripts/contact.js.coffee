jQuery ->
  $("#map-container-wide iframe").width($("body").width())

  $(window).on 'resize', ->
    $("#map-container-wide iframe").width($("body").width())
