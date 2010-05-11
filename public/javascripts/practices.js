var Practices = {
  accordion_draggable: function() {
    $('#techniques_accordion .asana').draggable({
      scroll: false,
      connectToSortable: '#practice_techniques',
      helper: 'clone',
      appendTo : 'body',
      revert: 'invalid',
      drag: function(event, ui) {
        ui.helper.css({width: '150px', height: '150px'});
      }
    });

    $('#techniques_accordion .mudra').draggable({
      scroll: false,
      helper: 'clone',
      appendTo : 'body',
      revert: 'invalid',
      drag: function(event, ui) {
        ui.helper.css({border:'1px solid black'});
      }
    });
  }
};