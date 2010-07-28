$(document).ready(function(){
  $('.practice_technique .actions li').live('mouseover', function() { $(this).addClass('ui-state-hover');});
  $('.practice_technique .actions li').live('mouseout', function() { $(this).removeClass('ui-state-hover');});
  $('.associated-technique-actions .ui-state-default').live('mouseover', function() { $(this).addClass('ui-state-hover');});
  $('.associated-technique-actions .ui-state-default').live('mouseout', function() { $(this).removeClass('ui-state-hover');});
});

var Practices = {
  accordion_draggable: function(sortable_id) {
    $('#techniques_accordion .asana').draggable({
      scroll: false,
      connectToSortable: sortable_id,
      helper: 'clone',
      appendTo : 'body',
      revert: 'invalid',
      drag: function(event, ui) {
        ui.helper.css({width: '150px', height: '150px'});
      }
    });

    $('#techniques_accordion .mudra, #techniques_accordion .manos').draggable({
      scroll: false,
      helper: 'clone',
      appendTo : 'body',
      revert: 'invalid',
      drag: function(event, ui) {
        ui.helper.css({border:'1px solid black'});
      }
    });
  },
  resetCountdown: function(minutes, seconds) {
    $('#countdown').countdown('destroy');
    continuous = $('#practice_continuous').is(':checked');
    if(continuous) {
      $('#countdown').countdown({until: '+' + $('#practice_delay').val() + 's', format: 'MS', compact: true, description: '', onExpiry: function() {
        $('#countdown').countdown('change', {until: '+' + minutes + 'm +' + seconds + 's', format: 'MS', compact: true, description: '', onExpiry: function() {$('#jpId').jPlayer('play');$('#slideshow_practice_techniques').cycle('next');}});
      }});
    } else {
      $('#countdown').countdown({until: '+' + minutes + 'm +' + seconds + 's', format: 'MS', compact: true, description: '', onExpiry: function() {$('#jpId').jPlayer('play');$('#slideshow_practice_techniques').cycle('next');}});
      $('#countdown').countdown('pause');
    }
  },
  toggleDelayFields: function() {
    if($('#practice_continuous').is(':checked')) {
      $('#delay_field').show();
    }
    else {
      $('#delay_field').hide();
    }
  },
  addAnga: function() {
      $('#practice_parts').tabs('add','#new_tab','new tab');
  }
};