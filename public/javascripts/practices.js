$(document).ready(function(){
  $('.practice_technique .actions li').live('mouseover', function() { $(this).addClass('ui-state-hover');});
  $('.practice_technique .actions li').live('mouseout', function() { $(this).removeClass('ui-state-hover');});
  $('.associated-technique-actions .ui-state-default').live('mouseover', function() { $(this).addClass('ui-state-hover');});
  $('.associated-technique-actions .ui-state-default').live('mouseout', function() { $(this).removeClass('ui-state-hover');});
});

var Practices = {
  accordion_draggable: function(sortable_id, primary_technique_type, secondary_technique_types) {
    $('#techniques_accordion ' + primary_technique_type).draggable({
      scroll: false,
      connectToSortable: sortable_id,
      helper: 'clone',
      appendTo : 'body',
      revert: 'invalid',
      drag: function(event, ui) {
        ui.helper.css({width: '150px', height: '150px'});
      }
    });
    if(secondary_technique_types && secondary_technique_types.length > 0) {
    secondary_technique_types_array = secondary_technique_types.split(',');
    selector = jQuery.map(secondary_technique_types_array, function(type, i){
      return ('#techniques_accordion ' + type.trim());
    }).join(',');
    $(selector).draggable({
      scroll: false,
      helper: 'clone',
      appendTo : 'body',
      revert: 'invalid',
      drag: function(event, ui) {
        ui.helper.css({border:'1px solid black'});
      }
    });
    }
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
  },
  adjustEditorSize: function() {
    $('#practice_editor .part-techniques').height(Practices.calculateEditorHeight());
    $('#accordion_container').height(Practices.calculateAccordeonHeight());
    $(window).resize(function() {
      $('#practice_editor .part-techniques').height(Practices.calculateEditorHeight());
      $('#accordion_container').height(Practices.calculateAccordeonHeight());
    });
  },
  calculateAccordeonHeight: function() {
    ff_diff = $.browser.mozilla ? 2 : 0;
    return $(window).height() - $('#practice_data').height() - $('#header').height() - $('#practice_actions').height() - $('#notifications').height() - $('#tips').height() - 110 + ff_diff;
  },
  calculateEditorHeight: function() {
    ff_diff = $.browser.mozilla ? 2 : 0;
    return $(window).height() - $('#practice_data').height() - $('#header').height() - $('#practice_actions').height() - $('#notifications').height() - $('#tips').height() - 131 + ff_diff;
  },
  init_quicksearch: function() {
    Practices.qs = $('#q').quicksearch('.techniques-list .technique', {selector: 'h3'});
  },
  init_accordion: function() {
    $("#techniques_accordion").accordion({ fillSpace: true, changestart: function(event, ui) {
      Practices.load_accordion_techniques(ui.newHeader.attr('symbol'));
    }});
  },
  load_accordion_techniques: function(technique_type_symbol, actual_techniques_token) {
    if($('#' + technique_type_symbol + '_techniques_list').length == 0) {
      cached_techniques_token = jQuery.jStore.get('techniques_token');
      cached_techniques = jQuery.jStore.get(technique_type_symbol);
      if(actual_techniques_token && cached_techniques_token && actual_techniques_token == cached_techniques_token && cached_techniques) {
        $('#' + technique_type_symbol + '_techniques_viewport').html(cached_techniques);
        Practices.accordion_draggable($('.ui-tabs-selected a').attr('href'), $('.ui-tabs-selected').attr('primary_technique_type'), $('.ui-tabs-selected').attr('secondary_technique_types'));
        Practices.qs.cache();
      } else {
        $.ajax({
          type:'get',
          data: { 'symbol': technique_type_symbol },
          dataType: 'html',
          url: '/techniques',
          success: function(data){
            jQuery.jStore.set(technique_type_symbol, data);
            if(actual_techniques_token)
              jQuery.jStore.set('techniques_token', actual_techniques_token);
            cached_techniques = data;
            $('#' + technique_type_symbol + '_techniques_viewport').html(cached_techniques);
            Practices.accordion_draggable($('.ui-tabs-selected a').attr('href'), $('.ui-tabs-selected').attr('primary_technique_type'), $('.ui-tabs-selected').attr('secondary_technique_types'));
            Practices.qs.cache();
          }
        });
      }
    }
  }
};