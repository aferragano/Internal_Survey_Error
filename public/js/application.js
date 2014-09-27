$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.signup').hide();
  $('.login').hide();
  $('.login-button').click(function(){
    $('.login').show();
    $('.signup').hide();
  })
    $('.signup-button').click(function(){
    $('.signup').show();
    $('.login').hide();
  })
    $('.login').hide();
});
