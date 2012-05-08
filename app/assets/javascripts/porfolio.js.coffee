
jQuery ->
$('.explanation').children().hide()
$('.clickable').on 'click', ->
    $('.explanation').children().stop(true,true).slideUp(500)
    $('#' + $(this).attr('id') + "-sidebar").stop(true,true).slideDown(500)


