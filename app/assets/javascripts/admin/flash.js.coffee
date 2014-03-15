$ ->
  $(".flash a.close").click ->
    $(this).parent().transition({ "height": 0, "padding-top": 0, "padding-bottom": 0, "opacity": 0 }, 250, 'in-out', -> $(this).hide())
    false
