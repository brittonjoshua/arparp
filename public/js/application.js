$(document).ready(function() {
  $('.navbar').on("click", ".login-link", function() {
    event.preventDefault();

    var link = $(this).attr("href")
    var method = 'get'

    request = $.ajax({
      url: link,
      method: method
    })

    request.done(function(response) {
      $('form').remove();
      $('body').prepend(response);
    })
  })

    $('.navbar').on("click", "#register-link", function() {
    event.preventDefault();

    var link = $(this).attr("href")
    var method = 'get'

    request = $.ajax({
      url: link,
      method: method
    })

    request.done(function(response) {
      $('form').remove();
      $('body').prepend(response);
    })
  })

// find form answers are written into
// prevent default submit
// find data, action, method
// make partial so response is only html from the new post
// after ajax stuff, append the post to the list (ul) of answers
 $("#add-answer-form").on("submit", function(event){
    event.preventDefault();
    var $form = $(this);
    var $formData = $form.serialize();
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $formData
      })
    .done(function(response){
    $('ul').append(response);
    $("#add-answer-form")[0].reset();

    })
 });

});
