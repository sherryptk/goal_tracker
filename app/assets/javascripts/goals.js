$(document).ready(function(){

$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/goals/" + id + ".json", function(data) {
      // Replace text of body-id div
      $("#body-" + id).text(data.data.attributes["description"]);
    });
  });
});

})
