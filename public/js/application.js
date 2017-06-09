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

    $('#post-question').on("submit", function(event) {
      event.preventDefault();
      // console.log("it is working");
      var $form = $(this);
      var method = $form.attr("method");
      var action = $form.attr("action");
      var $data = $form.serialize();

      request = $.ajax({
        method: method,
        url: action,
        data: $data
      })
      request.done(function(response) {
        console.log(response);
        $('.list-group').append(response);
        $('#post-question')[0].reset();
      })
    })
});






