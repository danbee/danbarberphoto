$(document).ready ->
  $(".fancy").fancybox
    afterLoad: () ->
      $.post "/photos/#{this.element.attr('id')}/log_view"
