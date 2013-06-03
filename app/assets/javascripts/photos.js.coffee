$(document).ready ->
  $(".fancy").fancybox
    titlePosition: "inside"
    onComplete: (links, index) ->
      $.get "/photos/" + $(links[index]).attr("id") + "/log_view"
