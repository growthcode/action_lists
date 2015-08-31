$(document).ready(function() {
  $('.modalTaskEditOn').delegate('.task-row', "click", function(event) {
    event.preventDefault();
    /* Act on the event */
    $that = $(this);
    var plan_id = $that.data('plan');
    var task_id = $that.attr('id').replace('tasks_', '');
    var url = $that.data('url-modal-edit')
    $.ajax({
      url: url,
      type: 'GET',
      data: {plan_id: plan_id, id: task_id},
    })
    .done(function(data) {
      console.log("success");
      $edit_task = $('#edit_task');
      if ($edit_task.size() > 0) {
        $edit_task.replaceWith(data.modal);
      } else {
        $('#modals-container').append(data.modal);
      }
      $('#edit_task').modal();
    })
    .fail(function(data) {
      console.log("error");
    })
    .always(function(data) {
      console.log("complete");
    });
  });
});
