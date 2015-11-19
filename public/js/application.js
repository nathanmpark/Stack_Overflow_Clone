$(document).ready(function() {

 var hideElement = function(element){
  element.hide();
 }

 hideElement("PUT FORM HERE")
 $('PUT BUTTON HERE').on('submit', function(event) {
  event.preventDefault
  $('PUT FORM HERE').show();
 });

  // This is called after the document has loaded in its entirety

 // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

});
