$(document).ready(function(){

$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/goals/" + id + ".json", function(data) {
      $("#body-" + id).text(data["goal"]["description"]);
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
        var goal = new Goal(data["goal"]["title"], data["goal"]["description"], data["goal"]["categories"]["0"]["name"])

        $('form').hide();
        $('#pageHeading').hide();
        goal.postGoal();
      });
    });
  });

  class Goal {
  constructor(title, description, category) {
    this.title = title;
    this.description = description;
    this.category = category;
  }

  postGoal() {
    $("#goalHeading").text("Your New Goal:");
    $("#goalTitle").text(`${this.title}`);
    $("#goalDescription").text("Description: " + `${this.description}`);
    $("#category").text("Category: " + `${this.category}`);
  }
}

})
