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

    $('.post-question-container').on("click", "#post-question", function(event) {
      event.preventDefault();
      // console.log("it is working");
      var $form = $(this);
      var method = $form.attr("method");
      // console.log(method);
      var action = $form.attr("action");
      // console.log(action);
      var data = $form.serialize();

      request = $.ajax({
        method: method,
        url: action,
        data: data
      })
      request.done(function(response) {
        console.log(response);
      })
    })

});






