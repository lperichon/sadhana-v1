$(document).ready(function(){
    $('.help').live('mouseover', function() { $(this).addClass('ui-state-hover');});
    $('.help').live('mouseout', function() { $(this).removeClass('ui-state-hover');});
});

var newWin = null;
function popUp(strURL, strType, strHeight, strWidth) {
 if (newWin != null && !newWin.closed)
   newWin.close();
 var strOptions="";
 if (strType=="console")
   strOptions="resizable,scrollbars,height="+
     strHeight+",width="+strWidth;
 if (strType=="fixed")
   strOptions="status,height="+
     strHeight+",width="+strWidth;
 if (strType=="elastic")
   strOptions="toolbar,menubar,scrollbars,"+
     "resizable,location,height="+
     strHeight+",width="+strWidth;
 newWin = window.open(strURL, 'newWin', strOptions);
 newWin.focus();
 return newWin;
}