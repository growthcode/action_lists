$(document).ready(function() {
  $(".sortableInbox").sortable({
    connectWith: ".connectedSortable",
    placeHolder: ".task",
    cursor: "move",
    tolerance: "pointer",
    revert: '100',
    helper : 'clone',
    start: function(event, ui) {
      $(ui.item).attr('style', '');
    },
    update: function(event, ui){
      console.log("in the sortable function");
      $.post($(this).data('sort-url'), $(this).sortable('serialize'))
      .success(function(data){
        console.log("in the 'success' function");
        $('.task-row').each(function(){
          $(this).attr('style', '');
          $(this).children('.task-position').html($(this).index() + 1);
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
