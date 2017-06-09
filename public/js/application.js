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
    $('#answers-list').append(response);
    $("#add-answer-form")[0].reset();
    });
 });

});
