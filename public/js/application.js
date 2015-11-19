$(document).ready(function() {

  hideElement("#comment-submitter");
  // hideElement("#answer-form");
  commentHandler()
  voteHandler();
});
//     $('#answer').on('submit'), function(event){
//       event.preventDefault();
//       data = $(this).serialize()
//       $.ajax({method: 'post',
//               url: '/answers',
//               dataType: 'json'})
//       .done(function(response){
//         // put in html <li>response.content</li>
//         // append to answer list
//         $('#answer_list').append('<li>'+ response.content + <span> + response.user_id.username + </span></li>)
//         });
//       });
//     });

// // END OF KIM'S WORK









 var hideElement = function(element){
  $(element).hide()};

 var showElement = function(element){
  $(element).show()};


  var commentHandler = function(){$('#question-comment').on('click', function(event) {
    event.preventDefault();
    hideElement("#question-comment")
    showElement('#comment-submitter')
  });
};

  $('#submitter').on('submit', function(event) {
    event.preventDefault();
    var resp_submission = $('#submitter').serialize();

    $.ajax({
       method: "POST",
       url: "/comments",
       dataType: 'text',
       data: resp_submission
     })
    .done(function(response){
      console.log(response)
     $('#response_holder').html(response)


    })
  });



  // Array();
  // var response_submition_final = response_submition[0]["value"]


  // Not finished yet.....

  //  $("#comment_form").on('submit', function(event){
  //   event.preventDefault();
  //   var formInputs = $(this).serializeArray()
  //   var comment = formInputs[0]['value'];
  //   var author = formInputs[1]['value'];
  //   debugger
  //   console.log(comment)

  //   if (comment != '' || author != ''){
  //     $('#comment_list').append('<li>' + comment + '<span class="author">' + author + '</span></li>');
  //   };

  // })


var voteHandler = function() {
  $(".vote_buttons").on("click", function(event){
    event.preventDefault();
    // debugger
    var question_id = $(this).parent().parent().attr("id")
    if ($(this).attr("id") === "upvote"){
      var vote_type = true
    }
    else if ($(this).attr("id") === "downvote") {
      var vote_type = false
    }

    var request = $.ajax({
      url: "/questions/" + question_id + "/votes",
      method: "post",
      dataType: "json",
      data: {upvote: vote_type, question_id: question_id}
    })

    request.done(function(data) {
      $('#'+data.question_id + ' span#vote_count').html(data.total_votes);
    });
  });
};

