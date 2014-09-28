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
  });
    $('.signup-button').click(function(){
    $('.signup').show();
    $('.login').hide();
  });
    $('.question-form').hide();
    $('#create-survey').submit(function(event){
      event.preventDefault();
      $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: "html"
      }).done(function(){
        $('.create-survey-title').hide(function(){
        $('.question-form').show();
      })
      })
    });
    $('#create-question').submit(function(event){
      event.preventDefault();
      $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: "html"
      }).done(function(){
        $('#create-question').trigger("reset", 4);
      })
    })
    // $('#show-survey').hide();
    // $('#submit-survey').submit(function(event){
    //   event.preventDefault();
    //   $.ajax({
    //     type: "POST",
    //     url: $(this).attr('action'),
    //     data: $(this).serialize(),
    //     dataType: "html"
    //   })
    //   $('#show-survey').show();
    // });
});
