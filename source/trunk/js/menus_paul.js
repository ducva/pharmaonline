/*----------------------------------------------------
// menus.js
//
//--------------------------------------------------*/

/*----------------------------------------------------
// Browser Detect
//--------------------------------------------------*/

var isNav, isIE, isNN6;

if (parseInt(navigator.appVersion) >= 4) {
	if (navigator.appName == "Netscape") {
		isNav = true;
		if(document.getElementById){
			isNN6=true;
		}
		else {
			isNN6=false;
		}
		
	} else {
		isIE = true;
	}
}

/*----------------------------------------------------
// Global variables
//--------------------------------------------------*/

// global list of all menuItems.
// Keeps track of menuItem ids and provides a quick
// method for grabbing the handle of a menuItem based
// on its id.
var menuItems = new Array();

// global list of all menuItemProps.
// Keeps track of menuItemProp ids and provides a quick
// method for grabbing the handle of a menuItemProp based
// on its id.
var menuItemProps = new Array();

var rootMenu = null;				// rootMenu
var timer;							// Timer.  Gives a pause before collapsing all menus.
var holdtime = 0;					// Pause time before collapsing all menus.
var image;
var imageName;

/*----------------------------------------------------
// Some global functions.
//--------------------------------------------------*/

/*----------------------------------------------------
// collapseRootMenu
//----------------------------------------------------
// Hides all open menus beginning with rootMenu.
//--------------------------------------------------*/

function collapseRootMenu() {

	if (rootMenu) {
		rootMenu.hide();
		rootMenu = null;
		collapseRootMenu()
//		turnOff(imageName)
		showStatus('')
	}
}


/*----------------------------------------------------
// openRootMenu
//----------------------------------------------------
// Opens a menu as the rootMenu.  Use this function
// to begin a cascading menu instead of calling the
// menu's show method directly.
//--------------------------------------------------*/

function openRootMenu(menu, left, top, z_index, image) {
	
	// If any other menus are open, close them.
	if (rootMenu) {
		collapseRootMenu();
	}
	
	// If the timer has been started, clear it.
	if (timer) {
		clearTimeout(timer);
	}
	
	// Assign menu as the rootMenu
	if (menu) {
		rootMenu = menu;
		rootMenu.expand(left, top, z_index, image);
		rootMenu.show(image);
		imageName = image	
		//timer = setTimeout("collapseRootMenu();", holdtime);	
	}
	
}


/*----------------------------------------------------
// menuItemProp Object
//--------------------------------------------------*/

/*----------------------------------------------------
// menuItemProp
//----------------------------------------------------
// Constructor for menuItemProp
// Describes display properties of a menuItem
//--------------------------------------------------*/

function menuItemProp(width, bgcolor, highlightcolor, borderwidth, imagesrc, imagewidth, css_attributes) {

	// Grab next menuItemProp id from global list.
	var id = menuItemProps.length;

	this.id = id;
	this.className = "menuProp" + id;

	this.width = width;
	this.bgcolor = bgcolor;
	this.highlightcolor = highlightcolor;
	this.borderwidth = borderwidth;
	this.imagesrc = imagesrc;
	this.imagewidth = imagewidth;
	
	// Establish style tag for this menuProp.
	var styleStr = "\n\n<STYLE TYPE='text/css'>\n";
	styleStr += "<!--\n";
	styleStr += "." + this.className + " {\n";
	
	for (var i in css_attributes) {
		styleStr += i + ": " + css_attributes[i] + ";\n";
	}
	
	styleStr += "}\n";
	styleStr += "// -->\n";
	styleStr += "</STYLE>\n";
 
	document.write(styleStr);
	
	menuItemProps[id] = this;			// Add to global list of menuItemProps.
	
	return this;
}



function menuItem(label, onclick, props, sub_menu) {

	// Grab next menuItem id from global list.
	var id = menuItems.length;
	var objTag = "";

	if (isIE || isNN6) {
		objTag += "<div id=\"" + id + "\"";
		objTag += " class=\"" + props.className + "\"";
		objTag += " style=\"";
		objTag += " position: absolute;";
		objTag += " visibility: hidden;";
		objTag += " left: 15";
		objTag += " top: 0;";
		objTag += " width: 180px;";
		objTag += " background-color: " + props.bgcolor +";";
		objTag += " z-index: 0;height:18px; border:1px solid #CCCCCC";
		objTag += "\"";
		objTag += " onmouseover=\"menuItem_mouseover('" + id + "');\"";
		objTag += " onmouseout=\"menuItem_mouseout('" + id + "');\"";
		if (onclick) {
			objTag += " onclick=\"collapseRootMenu();" + onclick + "\"";
		}
		objTag += ">";
		if (sub_menu) {
			 objTag += "<img src=\"" + props.imagesrc + "\" border=\"0\" align=\"right\" width=\"" + props.imagewidth + "\" vspace=\"2\">"
		}
		objTag += "&#160;" + label
		objTag += "</nobr></div>";
	} else if (isNav){
		objTag += "<layer id=\"" + id + "\"";
		objTag += " class=\"" + props.className + "\"";
		objTag += " visibility=\"hidden\"";
		objTag += " left=0";
		objTag += " top=0";
		objTag += " width=" + props.width;
		objTag += " bgcolor=" + props.bgcolor;
		objTag += " z-index=0";
		objTag += " onmouseover=\"menuItem_mouseover('" + id + "');\"";
		objTag += " onmouseout=\"menuItem_mouseout('" + id + "');\"";
		if (onclick) {
			objTag += " onfocus=\"collapseRootMenu();" + onclick + "\"";
		}
		objTag += ">";
		if (sub_menu) {
			 objTag += "<img src=\"" + props.imagesrc + "\" border=\"0\" align=right width=\"" + props.imagewidth + "\" vspace=\"2\">"
		}
		objTag += "&#160;" + label
		objTag += "</layer>";
	}
	
	// Create object.
	document.write(objTag);

	this.obj = getMenuItem(id);		// Store a handle to the object we just created.
	this.id  = id;
	this.menu = null;				// The menu that the menuItem belongs to.
	this.subMenu = sub_menu;		// A subMenu to display beneath the menuItem.
	
	// Save the display properties that we need.
	this.bgcolor = props.bgcolor;
	this.highlightcolor = props.highlightcolor;
	this.borderwidth = props.borderwidth;

	menuItems[id] = this;			// Add to global list of menuItems.
	return this;
}


/*----------------------------------------------------
// getMenuItem
//----------------------------------------------------
// Grabs a handle to a menuItem's object based on id.
// Called by menuItem constructor.
//--------------------------------------------------*/

function getMenuItem(id) {
	if (isIE) {
		return eval("document.all(\"" + id + "\")");
	} else if (isNav) {
		if(isNN6)
			{
			return document.getElementById(''.concat(id));
			}
		else
			{
			return eval("document.layers[\"" + id + "\"]");
			}
	}
	return null;
}


/*----------------------------------------------------
// menuItem_mouseover
//----------------------------------------------------
// Event handler for menuItem mousovers.
// Is passed the id of the menuItem.
//--------------------------------------------------*/

function menuItem_mouseover(id) {
	// Clear timer to avoid collapse of all menus.
	clearTimeout(timer);

	var currMenuItem = menuItems[id];
	var currMenu = currMenuItem.menu;
	var obj = currMenuItem.obj;

	currMenu.setActiveMenuItem(currMenuItem);

	// If another subMenu is open for the current menu, close it.
	if (currMenu.openSubMenu) {
		currMenu.openSubMenu.hide();
		currMenu.openSubMenu = null;
	}

	// If there is a subMenu associated with this menuItem, open it.
	if (currMenuItem.subMenu) {
		if (currMenuItem.subMenu.width <= 0 || currMenuItem.subMenu.height <= 0) {
			currMenuItem.subMenu.calculateDimensions();
		}

		// Determine position for subMenu based on position of menuItem and current menu's direction.

		var left, top, z_index;
		
		var objLeft, objTop, objWidth, objHeight, objZIndex;
		var pageLeft, pageRight, pageTop, pageBottom;
		
		if (isIE) {
			objLeft = obj.style.pixelLeft;
			objTop = obj.style.pixelTop;
			objWidth = obj.offsetWidth;
			objHeight = obj.offsetHeight;
			objZIndex = obj.style.zIndex;
			pageLeft = document.body.scrollLeft;
			pageRight = document.body.clientWidth + document.body.scrollLeft;
			pageTop = document.body.scrollTop;
			pageBottom = document.body.clientHeight + document.body.scrollTop;
			} else if (isNav) {
			objLeft = obj.left;
			objTop = obj.top;
			objWidth = obj.clip.width;
			objHeight = obj.clip.height;
			objZIndex = obj.zIndex;
			pageLeft = pageXOffset;
			pageRight = window.innerWidth + pageXOffset;
			pageTop = pageYOffset;
			pageBottom = window.innerHeight + pageYOffset;
		}

		//if (currMenu.direction == "right" && (objLeft + objWidth - 4 + currMenuItem.subMenu.width > pageRight)) {
		if (currMenu.direction == "right" && (objLeft + 80 + currMenuItem.subMenu.width > pageRight) && (objLeft - 80 + objWidth - currMenuItem.subMenu.width >= pageLeft)) {
			currMenu.direction = "left";
		//} else if (currMenu.direction == "left" && (objLeft + 4 - currMenuItem.subMenu.width < pageLeft)) {
		} else if (currMenu.direction == "left" && (objLeft -80 < pageLeft) && (objLeft + 80 + currMenuItem.subMenu.width <= pageRight)) {
			currMenu.direction = "right";
		}
			
		currMenuItem.subMenu.direction = currMenu.direction;
			
		if (currMenu.direction == "right") {
			//left = objLeft + objWidth - 4;
			left = objLeft + 80;
		} else {
			//left = objLeft + 4 - currMenuItem.subMenu.width;
			left = objLeft - 80 + objWidth - currMenuItem.subMenu.width;
		}
		
		top = objTop + 20;
		
		while (top + currMenuItem.subMenu.height > pageBottom && top - objHeight + currMenuItem.borderwidth > pageTop) {
			top -= objHeight - currMenuItem.borderwidth;
		}

//		if (top + currMenuItem.subMenu.height > pageBottom) {
//			top -= currMenuItem.subMenu.height - objHeight + 8; 
//		}
		z_index = objZIndex + 1;
	
		currMenuItem.subMenu.expand(left, top, z_index);
		currMenuItem.subMenu.show();
		currMenu.openSubMenu = currMenuItem.subMenu;
		
	}
}


/*----------------------------------------------------
// menuItem_mouseout
//----------------------------------------------------
// Event handler for menuItem mouseouts.
// Uses global variable holdtime.
//--------------------------------------------------*/

function menuItem_mouseout() {
	// Begin timer to collapse all menus.
	
	timer = setTimeout("collapseRootMenu();", holdtime);
}


/*----------------------------------------------------
// menu Object and Related Functions
//--------------------------------------------------*/

/*----------------------------------------------------
// menu
//----------------------------------------------------
// Constructor for menu
//
// Pass in handles to each of its menuItems.
//--------------------------------------------------*/

function menu() {

	//--------------------------------------------------------------------------------
	// Assign each menuItem argument individually.
	// Normally, we would just assign the whole array to menuItems.
	//
	// e.g.		this.menuItems = menu.arguments
	//
	// However, Netscape Communicator 4.05 has a bug that messes up the assignment.
	//--------------------------------------------------------------------------------

	this.menuItems = new Array();
	for (var i = 0; i < menu.arguments.length; i++) {
		this.menuItems[i] = menu.arguments[i];
		menu.arguments[i].menu = this;
	}

	this.width = 0;					// Overall width of menu.
	this.height = 0;				// Overall height of menu.
	this.direction = "right";		// Initially, all menus should go to the right.
	this.openSubMenu = null;		// Handle to any open subMenus.
	this.activeMenuItem = null;		// Handle to menuItem under cursor.
	this.show = menu_show;			// Method to display the menu.
	this.hide = menu_hide;			// Method to hide the menu.
	this.expand = menu_expand;		// Method to place menu at a specific position.
	
	// Method for calculating dimensions of menu.  Normally, we would do this in the menu's
	// constructor (i.e. this routine).  However, IE4 doesn't expose the offsetWidth and
	// offsetHeight properties immediately.  So we'll calculate the dimensions when we first need
	// them.
	this.calculateDimensions = menu_calculateDimensions;
	
	// Method for setting the activeMenuItem.
	this.setActiveMenuItem = menu_setActiveMenuItem;

	return this;
}


/*----------------------------------------------------
// menu_calculateDimensions
//----------------------------------------------------
// Calculates the overall width and height of the menu.
// These dimensions are used to prevent the menu from 
// running off of the page.
//--------------------------------------------------*/

function menu_calculateDimensions() {
	var menuItemWidth = 0;
	var menuItemHeight = 0;
	
	for (var i = 0; i < this.menuItems.length; i++) {
		var borderwidth = this.menuItems[i].borderwidth;
		var obj = this.menuItems[i].obj;
		if (isIE) {
			menuItemWidth = obj.offsetWidth;
			menuItemHeight = obj.offsetHeight - borderwidth;
		} else if (isNav) {
			if (isNN6)
				{
				var obj = document.getElementById(''.concat(this.menuItems[i].id));
				menuItemWidth = obj.offsetWidth;
				menuItemHeight = obj.offsetHeight - borderwidth;
//				menuItemWidth = document.defaultView.getComputedStyle(obj, "").getPropertyValue("width");
//				menuItemHeight = document.defaultView.getComputedStyle(obj, "").getPropertyValue("height") - borderwidth;
				}
			else
				{
				menuItemWidth = obj.clip.width;
				menuItemHeight = obj.clip.height - borderwidth;
				}
		}
		this.width = menuItemWidth > this.width ? menuItemWidth : this.width;
		this.height += menuItemHeight;
	}
	
	// Netscape wraps its text but IE stretches it out.
	// So we're gonna resize the IE menusItems.
	if (isIE) {
		for (var i = 0; i < this.menuItems.length; i++) {
			this.menuItems[i].obj.style.width = this.width;
		}	
	}
}


/*----------------------------------------------------
// menu_setActiveMenuItem
//----------------------------------------------------
// Sets the activeMenuItem for a menu.
// Adjusts menuItem background colors accordingly.
//--------------------------------------------------*/

function menu_setActiveMenuItem(menuItem) {
	// Unhighlight previous activeMenuItem.
	if (this.activeMenuItem) {
		var obj = this.activeMenuItem.obj;
		var bgcolor = this.activeMenuItem.bgcolor;
		
		if (isIE) {
			obj.style.backgroundColor = bgcolor;
		} else if (isNav) {
			if(isNN6)
				{
				var obj= document.getElementById(''.concat(this.activeMenuItem.id));
				obj.style.backgroundColor = bgcolor;
				}
			else
				{
				obj.bgColor = bgcolor;
				}
		}
		this.activeMenuItem = null;
	}
	
	// Highlight new activeMenuItem if one is provided.
	if (menuItem) {
		var obj = menuItem.obj;
		var highlightcolor = menuItem.highlightcolor
		
		if (isIE) {
			obj.style.backgroundColor = highlightcolor;
		} else if (isNav) {
			if(isNN6)
				{
				var obj= document.getElementById(''.concat(menuItem.id));
				obj.style.backgroundColor = highlightcolor;
				}
			else
				{
				obj.bgColor = highlightcolor;
				}
		}
		this.activeMenuItem = menuItem;
	}
}


/*----------------------------------------------------
// menu_expand
//----------------------------------------------------
// Expand method for menus.
// Positions each menuItem separately.
// Pass in left, top and z-index coordinates.
//--------------------------------------------------*/

function menu_expand(left, top, z_index) {
	if (this.width <= 0 || this.height <= 0) {
		this.calculateDimensions();
	}

	// Place each menuItem independently.
	for (var i = 0; i < this.menuItems.length; i++) {
		var obj = this.menuItems[i].obj;
		var borderwidth = this.menuItems[i].borderwidth
		
		if (isIE) {
			obj.style.zIndex = z_index;
			obj.style.pixelLeft = left;
			obj.style.pixelTop = top;

			top += obj.offsetHeight - borderwidth;

		} else if (isNav) {
			if(isNN6)
				{
				var obj = document.getElementById(''.concat(this.menuItems[i].id));
				obj.style.zIndex = z_index;
				obj.style.left = left;
				obj.style.top = top;

				top += obj.offsetHeight - borderwidth;
				}
			else
				{
				obj.zIndex = z_index;
				obj.moveTo(left, top);
	
				top += obj.clip.height - borderwidth;
				}
		}
	}
}


/*----------------------------------------------------
// menu_show
//----------------------------------------------------
// Show method for menus.
// Changes visibility of each menuItem's object.
//--------------------------------------------------*/

function menu_show() {
	for (var i = 0; i < this.menuItems.length; i++) {
		var obj = this.menuItems[i].obj;
		if (isIE) {
			obj.style.visibility = "visible";
		} else if (isNav) {
			if (isNN6)
				{
				var obj = document.getElementById(''.concat(this.menuItems[i].id));
				obj.style.visibility = "visible";
				}
			else
				{
				obj.visibility = "visible";
				}
		}
	}
}


/*----------------------------------------------------
// menu_hide
//----------------------------------------------------
// Hide method for menus.
// Changes visibility of each menuItem's object.
//--------------------------------------------------*/

function menu_hide() {
	// Close any open submenus first.
	if (this.openSubMenu) {
		this.openSubMenu.hide();
		this.openSubMenu = null;
	}

	// Clear activeMenuItem
	this.setActiveMenuItem(null);
	
	// Reset direction to right
	this.direction = "right";

	for (var i = 0; i < this.menuItems.length; i++) {
		var obj = this.menuItems[i].obj;
		if (isIE) {
			obj.style.visibility = "hidden";
		} else if (isNav) {
			if (isNN6)
				{
				var obj = document.getElementById(''.concat(this.menuItems[i].id));
				obj.style.visibility = "hidden";
				}
			else
				{
				obj.visibility = "hidden";
				}
		}
	}
}
