$(document).ready(function(){
    $('.help').live('mouseover', function() { $(this).addClass('ui-state-hover');});
    $('.help').live('mouseout', function() { $(this).removeClass('ui-state-hover');});
});
