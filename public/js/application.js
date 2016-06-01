$(document).ready(function() {
  $('#new_q_link').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: 'questions/new',
      method: 'get'
      }).done(function(response){
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
});
