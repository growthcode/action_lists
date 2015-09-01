$(document).ready(function() {
  $(".positionSortList, .inboxSortList").sortable({
    connectWith: ".connectedSortable",
    placeHolder: ".task",
    cursor: "move",
    tolerance: "pointer",
    revert: '100',
    helper : 'clone',
    stop: function(event, ui) {
      $(ui.item).attr('style', '');
    },
    update: function(event, ui){
      console.log("in the sortable function");
      $.post($(this).data('sort-url'), $('.positionSortList').sortable('serialize'))
      .success(function(data){
        console.log("in the 'success' function");
        var count = 0
        $('.positionSortList .task-row').each(function(){
          count += 1
          $(this).find('.task-position-details').html(count);
        })
      })
      .error(function(data){
        console.log("in the 'failure' callback function");
      })
      .done(function(data){
        console.log("in the 'done' function");
      });
    }
  });

  $(".enableSort").on('click', function(event) {
    if ($(".enableSort").attr('class').includes('btn-info')) {
      $("#index-tasks ul.positionSortList").sortable("enable");
      $(".enableSort").removeClass('btn-info');
      $(".enableSort").text("Enabled");
      $(".enableSort").addClass('btn-warning');
    } else {
      $("#index-tasks ul.positionSortList").sortable("disable");
      $(".enableSort").removeClass('btn-warning');
      $(".enableSort").text("Disabled");
      $(".enableSort").addClass('btn-info');
    };
  });
  $(".enableSort").trigger('click');
});
