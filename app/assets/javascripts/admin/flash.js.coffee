$ ->
  $(".flash a.close").click ->
    $(this).parent().fadeOut(200)
    false
