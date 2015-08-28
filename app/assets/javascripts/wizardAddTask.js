$(document).ready(function() {
  $('.js-wizard-submit-task').on('click', createWizardTaskSubmit);
  $('.js-wizard-task-deed').on('keyup', createTaskEnter)
});

function createWizardTaskSubmit(event) {
  event.preventDefault();
  var url = $(this).parent('form').attr('action');
  var formdata = $(this).parent('form').serializeArray();
  var data = {};
  $(formdata).each(function(index, obj){
      data[obj.name] = obj.value;
  });
  $.ajax({
    url: url,
    type: 'POST',
    data: data,
  })
  .done(function(data) {
    console.log("success");
    $('.js-wizard-task-deed').val('')
    debugger
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
