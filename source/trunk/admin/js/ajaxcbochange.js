
// JavaScript Document

loadstatustext = 'Loading...';
function ajaxLoad(url,id)
   {
       if (document.getElementById) {
           var x = (window.ActiveXObject) ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
           }
           if (x)
               {
           x.onreadystatechange = function()
                   {
                       el = document.getElementById(id);
                       el.innerHTML = loadstatustext;
               if (x.readyState == 4 && x.status == 200)
                       {
                       el.innerHTML = x.responseText;
                   }
                   }
               x.open("GET", url, true);
               x.send(null);
               }
       }

// code demo by www.phpbasic.com
function display(cboname,table,field,value,divid)       
{
   ajaxLoad('include/ajaxcbochange.php?cboname='+cboname+'&table='+table+'&field='+field+'&value='+value,divid);
}
