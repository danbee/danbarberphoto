$(document).ready(function() {
  return $(".fancy").fancybox({
    afterLoad: function() {
      $.ajax({
        type: 'POST',
        url: "/photos/" + (this.element.data('id')) + "/views",
      });
    }
  });
});
