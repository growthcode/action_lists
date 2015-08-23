$(document).ready(function() {
  $(".sortableInbox").sortable({
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
      $.post($(this).data('sort-url'), $(this).sortable('serialize'))
      .success(function(data){
        console.log("in the 'success' function");
        var count = 0
        $('.task-row').each(function(){
          count += 1
          $(this).children('.task-position').html(count);
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
});
