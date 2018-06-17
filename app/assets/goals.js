
$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/posts/" + id + ".json", function(data) {
      // Replace text of body-id div
      $("#body-" + id).text(data);
    });
  });
});
