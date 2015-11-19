$(document).ready(function() {

 var hideElement = function(element){
  element.hide();
 }

 hideElement("PUT FORM HERE")
 $('PUT Response BUTTON HERE').on('click', function(event) {
  event.preventDefault
  $('PUT FORM HERE').show();
  hideElement("PUT respond button FORM HERE")
 });

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

  // });

});
