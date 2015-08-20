$(document).ready(function() {
  $(".js-add-task").on('click', createTaskSubmit);
  $(".inbox-wrapper .task-composer-textarea.js-task-deed").on('keyup', createTaskEnter)
  $('.js-cancel, .open-task-composer').on('click', toggleTaskComposer);
});

function createTaskSubmit(event){
  event.preventDefault();
  var createUrl = $(".js-add-task").data("create-url")
  var $taskDeedInput = $(".inbox-wrapper .task-composer-textarea.js-task-deed")
  var taskDeed = $taskDeedInput.val().trim()
  /* Act on the event */
  $.ajax({
    url: createUrl,
    type: 'POST',
    data: {taskDeed: taskDeed},
  })
  .done(function(data) {
    console.log("success");
    $('.inbox-wrapper .sortableInbox').append(data.taskLi);
    $taskDeedInput.val("");
    $taskDeedInput.focus();
  })
  .fail(function(data) {
    console.log("error");
  })
  .always(function(data) {
    console.log("complete");
  });
}

function createTaskEnter(event) {
  if (event.which == 13) {
    createTaskSubmit(event);
    return false;
  }
}

function toggleTaskComposer() {
  $(".task-composer").toggleClass('hide');
  $(".open-task-composer").toggleClass('hide');
}

