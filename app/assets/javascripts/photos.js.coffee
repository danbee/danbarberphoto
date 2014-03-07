$(document).ready ->
  $(".fancy").fancybox
    afterLoad: () ->
      $.post "/photos/#{this.element.data('id')}/log_view"
