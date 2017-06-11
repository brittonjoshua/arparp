$(document).ready(function() {
  $('.navbar').on("click", ".login-link", function() {
    event.preventDefault();

    var link = $(this).attr("href");
    var method = 'get';

    var request = $.ajax({
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

    var link = $(this).attr("href");
    var method = 'get';

    var request = $.ajax({
      url: link,
      method: method
    })

    request.done(function(response) {
      $('form').remove();
      $('body').prepend(response);
    })
  })

    // <!-- running the errors reloads the whole page with adding q -->
    // works if no errors


    $('#questions_intro').on("submit", '#post-question', function(event) {
      event.preventDefault();
      var $form = $(this);
      var method = $form.attr("method");
      var action = $form.attr("action");
      var $data = $form.serialize();

      var request = $.ajax({
        method: method,
        url: action,
        data: $data
      })
      request.done(function(response) {
        console.log(response);
        $('.list-group').append(response);
        $('#post-question')[0].reset();
      })
      request.fail(function(response) {
        console.log("fail")
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

  // was making the page incept itself
  // $("#question-comment").on("submit", function(event){
  //   event.preventDefault();
  //   // alert("hey");
  //   var $form = $(this);
  //   var $formData = $form.serialize();
  //   $.ajax({
  //     url: $form.attr('action'),
  //     method: $form.attr('method'),
  //     data: $formData
  //   })
  //   .done(function(response){
  //     // console.log(response)
  //     $('#comments-list').append(response);
  //     $("#question-comment")[0].reset();

  //   })
  // })

  $("#questions_intro").on("click", "#add_question_form_button", function() {
    event.preventDefault();

    var link = $(this).attr("href");
    var method = 'get';

    var request = $.ajax({
      url: link,
      method: method
    })

    request.done(function(response) {
      $("#add_question_form_button").hide()
      $("#questions_intro").append(response);
    })
  })

  $("#new_answer_forms").on("click", "#show_answer_form_button", function() {
    event.preventDefault();
    console.log("got here ok")

    var link = $(this).attr("href");
    var method = 'get';

    var request = $.ajax({
      url: link,
      method: method
    })

    request.done(function(response) {
      $("#show_answer_form_button").hide();
      $("#new_answer_forms").append(response);
    })
  })

  $("#new_question_comment_forms").on("click", "#show_question_comments_button", function() {
    event.preventDefault();

    var link = $(this).attr("href");
    var method = 'get';

    var request = $.ajax({
      url: link,
      method: method
    })

    request.done(function(response) {
      $("#show_question_comments_button").hide();
      $("#new_question_comment_forms").append(response);
    })
  })
});







