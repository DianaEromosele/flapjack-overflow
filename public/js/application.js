$(document).ready(function() {

  $('#new_q_link').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: 'questions/new',
      method: 'get'
      }).done(function(response){
        $('#new_q_link').hide();
        $('#question_list').prepend(response);
      });
  });


  $('#question_container').on('click', '#post_button', function(event){
    event.preventDefault();
    $.ajax({
      url: 'questions',
      method: 'post',
      data: $('#new_q_form').serialize()
    }).done(function(response){
      $('#new_q_form').hide();
      $('#errors_list').hide();
      $('#question_list').prepend(response);
    });
  });


  $("#submit_answer_link").on("click", function(event){
    event.preventDefault();
    var event = event.target
    $.ajax({
      method: "get",
      url: $("#submit_answer_link").attr("href")

    }).done(function(response){
      $("#new_answer").append(response);
      $("#submit_answer_link").hide();
    });
  });


  $("#new_answer").on("submit", "#answer_form", function(event){
    event.preventDefault();
    var event_target = event.target
    $.ajax({
      method: "post",
      url: $("#answer_form").attr("action"),
      data: $(event_target).serialize()
    }).done(function(response){
      $("#answer_form").remove();
      $(".answers_container").append(response);
      $("#submit_answer_link").show();
    });
  });


  $(".answers_container").on("click", "a", function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      method: "get",
      url: $target.attr('href')
    }).done(function(response){
      $target.parent().parent().find(".edit-form-container").html(response);
    });
  });


  $(".answers_container").on("submit", ".edit_form", function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      method: 'put',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response){
      $target.parent().parent().html(response);
    })
  });


   $(".answers_container").on("submit", ".delete_answer_form", function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      method: "delete",
      url: $target.attr("action")
    }).done(function(response){
      $target.parent().remove();
    })
  });

  $('#edit_question_link').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('href'),
      method: 'get'
      }).done(function(response){
        $target.hide();
        $('#edit_question_container').html(response);
      });
  });


   $('#edit_question_container').on('submit', '#edit-question-form', function(event){
    event.preventDefault();

    var $target = $(event.target)
    $.ajax({
      url: $target.attr("action"),
      method: "put",
      data: $target.serialize()
    }).done(function(response){
      $target.parent().hide();
      $("#question-title-body").html(response);
    });
  });

});
