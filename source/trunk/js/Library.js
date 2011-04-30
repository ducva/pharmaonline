function Flashwrite(url,w,h,id,bg,vars){

     var flashStr=
    "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+id+"' align='middle'>"+
    "<param name='allowScriptAccess' value='always' />"+
    "<param name='movie' value='"+url+"' />"+
    "<param name='FlashVars' value='"+vars+"' />"+
    "<param name='wmode' value='transparent' />"+
    "<param name='menu' value='false' />"+
    "<param name='quality' value='high' />"+
    "<embed src='"+url+"' FlashVars='"+vars+"' wmode='transparent' menu='false' quality='high' width='"+w+"' height='"+h+"' allowScriptAccess='always' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />"+
    "</object>";
    document.write(flashStr);
}
function isdefined( variable) {
    return (typeof(window[variable]) == "undefined")?  false: true;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function ImagePreview(vLink)
{
	if(vLink == '')
		{
		return false;
		}
	winDef = 'status=no,resizable=no,scrollbars=no,toolbar=no,location=no,fullscreen=no,titlebar=yes,height=1,width=1';
	window.open(vLink, '_new', winDef);
}
function openWinNews(vLink, vName, vHeight, vWidth)
{
	winDef = 'status=no,resizable=no,scrollbars=no,toolbar=no,location=no,fullscreen=no,titlebar=yes,height='.concat(vHeight).concat(',').concat('width=').concat(vWidth).concat(',');
	winDef = winDef.concat('top=').concat((screen.height - vHeight)/2).concat(',');
	winDef = winDef.concat('left=').concat((screen.width - vWidth)/2);
	newwin = open(vLink, vName, winDef);
}
function trim(inputString) {
   // Removes leading and trailing spaces from the passed string. Also removes
   // consecutive spaces and replaces it with one space. If something besides
   // a string is passed in (null, custom object, etc.) then return the input.
   if (typeof inputString != "string") { return inputString; }
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == " ") { // Check for spaces at the beginning of the string
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   ch = retValue.substring(retValue.length-1, retValue.length);
   while (ch == " ") { // Check for spaces at the end of the string
      retValue = retValue.substring(0, retValue.length-1);
      ch = retValue.substring(retValue.length-1, retValue.length);
   }
   while (retValue.indexOf("  ") != -1) { // Note that there are two spaces in the string - look for multiple spaces within the string
      retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); // Again, there are two spaces in each of the strings
   }
   return retValue; // Return the trimmed string back to the user
} // Ends the "trim" function

function OnSearch() {
	if(trim(document.frmSearch.txtSearch.value)=="") {
		document.frmSearch.txtSearch.focus();
		return false;
	}
	document.frmSearch.submit();
	return true;
}
	function turnOn(imageName) {
				if (document.images) {
  				document[imageName].src = eval(imageName + "on.src");
				}
	}

	function turnOff(imageName) {
		if (document.images) {
  				eval("document." + imageName + ".src  =  "+ imageName + "off.src" );
				}
	}

	NS4 = document.layers;
	if (NS4) {
 				origWidth = innerWidth;
 				origHeight = innerHeight;
	}

	function reDo() {
 				if (innerWidth != origWidth || innerHeight != origHeight)
    			location.reload();
	}

	if (NS4) onresize = reDo;

	function goCategory(strCategory,opennew) {
		if(opennew == 1) {
			window.open(strCategory, '_new', '');
		}
		else {
			window.location = strCategory;
			window.status=strCategory;
		}
	}
	
	function showStatus(msg) {
		window.status = msg;
	return true;
	}
function getIExko ( obj ) {
  if ( obj == document.body ) return obj.offsetLeft
  else return obj.offsetLeft +getIExko( obj.offsetParent );
}; //end getIExKo ( object ) -> int

function getIEyko ( obj ) {
  if ( obj == document.body ) return obj.offsetTop
  else return obj.offsetTop +getIEyko( obj.offsetParent );
}; //end getIEyko 
function Show(Name,MenuName)
{
	var MItem=document.getElementById('IDM_'.concat(Name));
	var width;
	
	if(isIE)
		width= MItem.offsetWidth;
	else if(isNav)
		{
		if(isNN6)
			{
			width= 130;//Padocument.defaultView.getComputedStyle(MItem, "").getPropertyValue("width");
			}
		else
			{
			width= 130;
			}
		}
	openRootMenu(MenuName, getIExko(MItem)+width+1, getIEyko(MItem)-23, 0, Name);
//	var MItem=document.getElementById('IDM_'.concat(Name));
//	if (MItem.innerHTML=='')
//		{
//		MItem.innerHTML = MItem.abbr;
//		MItem.abbr = '';
//		if(MenuOpen!='') Hide(MenuOpen);
//		MenuOpen= Name;
//		}
}

function Hide(Name)
{
	var MItem=document.getElementById('IDM_'.concat(Name));
	if (MItem.innerHTML!='')
		{
		MItem.abbr = MItem.innerHTML;
		MItem.innerHTML = '';
		}
}

function ismaxlength(obj)
{
	var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
	if (obj.getAttribute && obj.value.length>mlength)
	obj.value=obj.value.substring(0,mlength)
}