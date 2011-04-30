/*----------------------------------------------------
// Browser Detect
//--------------------------------------------------*/

var isNav, isIE;
if (parseInt(navigator.appVersion) >= 4) {
	if (navigator.appName == "Netscape") {
		isNav = true;
	} else {
		isIE = true;
	}
}

/*----------------------------------------------------
// Buy Button menuItemProp
//--------------------------------------------------*/

var msi_corp_website_style = new Array();

msi_corp_website_style["width"] = 180;
msi_corp_website_style["color"] = "#006633";
msi_corp_website_style["font-size"] = "12px";
msi_corp_website_style["font-weight"] = "normal";
msi_corp_website_style["font-style"] = "normal";	//bold
msi_corp_website_style["font-family"] = "Arial"; //if assign multiple fonts, it causes error!!
msi_corp_website_style["border-width"] = 0;
msi_corp_website_style["border-color"] = "#999999";
msi_corp_website_style["border-style"] = "solid";
msi_corp_website_style["line-height"] = "normal";
msi_corp_website_style["cursor"] = "hand";
if (isIE) {
	msi_corp_website_style['padding'] = 4;
} else if (isNav) {
	msi_corp_website_style['padding'] = 4;
}

var ltcategorybuttonstyle = new Array();

ltcategorybuttonstyle["width"] = 180;
ltcategorybuttonstyle["color"] = "#005826";
ltcategorybuttonstyle["font-size"] = "12px";
ltcategorybuttonstyle["font-weight"] = "bold";
ltcategorybuttonstyle["font-style"] = "bold";
ltcategorybuttonstyle["font-family"] = "arial";
ltcategorybuttonstyle["border-width"] = 1;
ltcategorybuttonstyle["border-color"] = "#ffffff";
ltcategorybuttonstyle["border-style"] = "solid";
ltcategorybuttonstyle["line-height"] = "normal";
ltcategorybuttonstyle["cursor"] = "hand";
if (isIE) {
	ltcategorybuttonstyle['padding'] = 0;
} else if (isNav) {
	ltcategorybuttonstyle['padding'] = 0;
}

var buybuttonstyle = new Array();

buybuttonstyle["width"] = 100;
buybuttonstyle["color"] = "#000000";
buybuttonstyle["font-size"] = "10px";
buybuttonstyle["font-weight"] = "normal";
buybuttonstyle["font-style"] = "normal";
buybuttonstyle["font-family"] = "sans-serif";
buybuttonstyle["border-width"] = 1;
buybuttonstyle["border-color"] = "#000000";
buybuttonstyle["border-style"] = "solid";
buybuttonstyle["line-height"] = "normal";
buybuttonstyle["cursor"] = "hand";
if (isIE) {
	buybuttonstyle['padding'] = 0;
} else if (isNav) {
	buybuttonstyle['padding'] = 0;
}

var msi_corp_website_prop = new menuItemProp(
	180,									// width
	"#FFFF99",								// bgcolor
	"#FF9900",								// highlightcolor
	1,										// borderwidth
	"/images/nav_arrow.gif",				// imagesrc
	9,										// imagewidth
	msi_corp_website_style
);

var msi_corp_website_prop_sub = new menuItemProp(
	180,									// width
	"#FFFF99",								// bgcolor
	"#FF9900",								// highlightcolor
	1,										// borderwidth
	"/images/nav_arrow.gif",				// imagesrc
	9,										// imagewidth
	msi_corp_website_style
);
