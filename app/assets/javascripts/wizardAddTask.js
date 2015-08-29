$(document).ready(function() {
  $('.js-wizard-submit-task').on('click', createWizardTaskSubmit);
  $('.js-wizard-task-deed').on('keyup', createWizardTaskEnter)
});

function createWizardTaskSubmit(event) {
  event.preventDefault();
  var url = $(this).parent('form').attr('action');
  var formdata = $(this).parent('form').serializeArray();
  var data = {};
  $(formdata).each(function(index, obj){
      data[obj.name] = obj.value.trim();
  });
  $.ajax({
    url: url,
    type: 'POST',
    data: data,
  })
  .done(function(data) {
    console.log("success");
    $('.list-tasks ul').prepend(data.taskRow)
    $('.js-wizard-task-deed').val('')
  })
  .fail(function(data) {
    console.log("error");
  })
  .always(function(data) {
    console.log("complete");
  });
}

function createWizardTaskEnter(event) {
  if (event.which == 13) {
    createWizardTaskSubmit(event);
    return false;
  }
}
