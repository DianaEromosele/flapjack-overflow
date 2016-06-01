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
});
