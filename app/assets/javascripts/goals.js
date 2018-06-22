$(document).ready(function(){

$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/goals/" + id + ".json", function(data) {
      $("#body-" + id).text(data.data.attributes["description"]);
    });
  });
});

$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/goals/" + nextId + ".json", function(data) {
      $(".goalTitle").text(data["data"]["attributes"]["title"]);
      $(".goalDescription").text(data["data"]["attributes"]["description"]);
      var editGoal = document.getElementsByClassName('js-edit')
      $(editGoal).attr('href', '/goals/' + nextId + '/edit');
      $(".js-next").attr("data-id", data["data"]["id"]);
    });
  });
});

$(function () {
    $('form').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize();

      var posting = $.post('/goals', values);

      posting.done(function(data) {
        var goal = data;
       $("#goalTitle").text(goal["data"]["attributes"]["title"]);
       $("#goalDescription").text(goal["data"]["attributes"]["description"]);
      });
    });
  });

})
