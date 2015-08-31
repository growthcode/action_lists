$(document).ready(function() {
  $('input[name="task[priority]"]').bootstrapSwitch({
    labelWidth: 0,
    onText: 'Active',
    offText: 'Defer',
    onColor: 'success',
    offColor: 'defer',
  });
});