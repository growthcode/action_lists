$(document).ready(function() {
  $('.priority-select-tag').on('change', savePriority);
});

function savePriority(e) {
  event.preventDefault();
  /* Act on the event */
  $prioritySelectTag = $(e.target);
  var url = $prioritySelectTag.data('url');
  $.ajax({
    url: url,
    type: 'PATCH',
    data: {'task[priority]': $prioritySelectTag.val()},
  })
  .done(function(data) {
    console.log("success");
    $prioritySelectTag.closest('.task-row').slideUp();
  })
  .fail(function(data) {
    console.log("error");
  })
  .always(function(data) {
    console.log("complete");
  });
}
