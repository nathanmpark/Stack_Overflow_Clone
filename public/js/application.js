$(document).ready(function() {

    $('#answer').on('submit'), function(event){
      event.preventDefault();
      data = $(this).serialize()
      $.ajax({method: 'post',
              url: '/answers',
              dataType: 'json'})
      .done(function(response){
        // put in html <li>response.content</li>
        // append to answer list
        $('#answer_list').append('<li>'+ response.content + <span> + response.user_id.username + </span></li>)
        });
      });
    });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
