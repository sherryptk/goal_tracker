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
        var goal = new Goal(data["goal"]["title"], data["goal"]["description"], data["goal"]["categories"]["0"]["name"])
        debugger
       $('form').hide();
       $('#pageHeading').hide();
       $("#goalHeading").text("Your New Goal:");
       $("#goalTitle").text(goal["goal"]["title"]);
       $("#goalDescription").text("Description: " + goal["goal"]["description"]);
       $("#category").text("Category: " + goal["goal"]["categories"]["0"]["name"]);
      });
    });
  });

  class Goal {
  constructor(title, description, category) {
    this.title = title;
    this.description = description;
    this.category = category;

  }

  sayHello() {
    console.log(`Hello, my name is ${this.name}`);
  }
}

})
