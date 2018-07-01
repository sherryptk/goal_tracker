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
      $(".goalTitle").text(data["goal"]["title"]);
      $(".goalDescription").text(data["goal"]["description"]);
      var editGoal = document.getElementsByClassName('js-edit')
      $(editGoal).hide();
      $('button.js-delete').hide();
      $(".js-next").attr("data-id", data["goal"]["id"]);
    });
  });
});

$(function () {
  $(".js-delete").on('click', function() {
    var id = $(this).data("id");
    $.ajax({
      url: ('/goals/' + id),
      type: 'POST',
      data: {"_method":"delete"},
      dataType: "json",
      success: function(msg){
        alert("Goal successfully deleted");
    }
    });
  });
  event.preventDefault();
});

$(function () {
    $('form#goal_form').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize();

      var posting = $.post('/goals', values);

      posting.done(function(data) {
        var goal = new Goal(data["goal"]["title"], data["goal"]["description"], data["goal"]["categories"]["0"]["name"], data["goal"]["categories"][0]["id"])
        $('form#goal_form').hide();
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
    $("#goalHeading").text("Your Goal:");
    $("#goalTitle").text(`${this.title}`);
    $("#goalDescription").text("Description: " + `${this.description}`);
    $("#category").text("Category: " + `${this.category}`);
  }
}

})
