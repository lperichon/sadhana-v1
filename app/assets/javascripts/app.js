
$.extend($.ui.tabs.prototype, {
    refreshPositions: function() {
        this.list = this.element.find('ol,ul').eq(0);
        this.lis = $('li:has(a[href])', this.list);
        this.anchors = this.lis.map(function() { return $('a', this)[0]; });
        return this;
    }
});

$(document).ready(function(){
    $('.ui-state-default').hover(
		function(){ $(this).addClass('ui-state-hover'); },
		function(){ $(this).removeClass('ui-state-hover'); }
	);
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