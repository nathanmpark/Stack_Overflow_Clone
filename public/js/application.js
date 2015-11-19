$(document).ready(function() {

 var hideElement = function(element){
  $(element).hide()};

 var showElement = function(element){
  $(element).show()};

  hideElement("#submitter")

  $('#responder').on('click', function(event) {
    event.preventDefault();
    hideElement("#responder")
    showElement('#submitter')
  });

  $('#submitter').on('submit', function(event) {
    event.preventDefault();
    var resp_submission = $('#submitter').serialize();

    $.ajax({
       method: "POST",
       url: "/response",
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

});
