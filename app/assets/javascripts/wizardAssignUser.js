$(document).ready(function() {
  $('.assign-save-btn').on('click', function(event) {
    event.preventDefault();
    $this = $(this)
    $parent = $this.parent()
    $parent.find('select')
    var url = $this.data('url')
    /* Act on the event */
    $.ajax({
      url: url,
      type: 'PATCH',
      data: {'task[priority]': $parent.find('.task-priority select').val(), 'task[role]': $parent.find('.task-person select').val()},
    })
    .done(function(data) {
      console.log("success");
      $parent.slideUp()
    })
    .fail(function(data) {
      console.log("error");
    })
    .always(function(data) {
      console.log("complete");
    });
  });
});
