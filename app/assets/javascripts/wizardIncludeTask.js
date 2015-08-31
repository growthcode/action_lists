$(document).ready(function() {

    // $('.task-row, ').delegate('input[name="task[included]"]', "click", function(event) {


  $taskInclude = $('input[name="task[included]"]')
  $taskInclude.bootstrapSwitch({
    labelWidth: 0,
    onText: 'Active',
    offText: 'Defer',
    onColor: 'success',
    offColor: 'defer',
  });
  $taskInclude.on('switchChange.bootstrapSwitch', function(event, state) {
    var $that = $(this);
    var $parentRow = $that.closest('.task-row');
    var url = $parentRow.data('url');
    $that.bootstrapSwitch('indeterminate', true);
    $.ajax({
      url: url,
      type: 'PATCH',
      data: {'task[included]': state},
    })
    .done(function(data) {
      console.log("success");
      $that.bootstrapSwitch('state', data.state);
      console.log(data.result);
    })
    .fail(function(data) {
      console.log("error");
      console.log(data.result);
    })
    .always(function(data) {
      console.log("complete");
    });
  });
});
