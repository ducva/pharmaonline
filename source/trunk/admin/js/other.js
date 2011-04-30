function change_color(name,num)
{
	for (c = 0; c < num; c++)
	{
		name.cells[c].style.backgroundColor = '#EEEEEE';
	}

}
function delete_color(name,num)
{
	for (c = 0; c < num; c++)
	{
		name.cells[c].style.backgroundColor = '';
	}
}



function show_tab(i){
	if (document.getElementById("tab_content_"+i)==null){
		return;
	}
	for (j=0;j<50;j++){
		if (document.getElementById("tab_content_"+j)!=null){
			document.getElementById("tab_content_"+j).style.display="none";
			document.getElementById("tab_"+j).style.backgroundColor = "#0084AF";
			document.getElementById("tab_"+j).style.color = "#333333";
		}

	}
	if (document.getElementById("tab_content_"+i)!=null){
		document.getElementById("tab_content_"+i).style.display="";
		document.getElementById("tab_"+i).style.backgroundColor = "#FE8C0E";
		document.getElementById("tab_"+i).style.color = "#333333";
	}
}


doFadeObjects = new Object();
doFadeTimers = new Object();

function doFade(object, destOp, rate, delta){
	if (!document.all)
	return
	if (object != "[object]"){
		setTimeout("doFade("+object+","+destOp+","+rate+","+delta+")",0);
		return;
	}

	clearTimeout(doFadeTimers[object.sourceIndex]);

	diff = destOp-object.filters.alpha.opacity;
	direction = 1;
	if (object.filters.alpha.opacity > destOp){
		direction = -1;
	}
	delta=Math.min(direction*diff,delta);
	object.filters.alpha.opacity+=direction*delta;

	if (object.filters.alpha.opacity != destOp){
		doFadeObjects[object.sourceIndex]=object;
		doFadeTimers[object.sourceIndex]=setTimeout("doFade(doFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
	}
}

function form_image(number)
{
	html='<table border="0" width="100%" cellpadding="0" cellspacing="0">';
	for(var i=0; i < number; i++ )
	{
		j=i+1;
		html=html+ "<tr><td>"+j+". <input name=image" + j + " type=file size=50></td>";
	}
	html=html+'</table>';
	document.getElementById("images").innerHTML=html;

}

var mainChecked = false;
var totalChecked = 0;
var lastChecked;
var selectStart;

function checkAll(form, name) {
	var element = 0;
	for (var checkbox = form.elements[element]; element <= form.elements.length; checkbox = form.elements[element++])
	{
		if (checkbox.name != 'allbox' && (!name || (name && checkbox.name.substr(0, name.length) == name)) && checkbox.type == 'checkbox')
		{
			if (checkbox.checked && mainChecked)
			{
				totalChecked--;
			} else if (!checkbox.checked && !mainChecked)
			{
				totalChecked++;
			}
			checkbox.checked = !mainChecked;
		}
	}
	mainChecked = !mainChecked;
}

function checkMain(form, name)
{
	mainChecked = true;
	for (var element = 0; element <= form.elements.length && mainChecked == true; element++)
	{
		var checkbox = document.form.elements[element];
		if (checkbox.name != 'allbox' && (!name || (name && checkbox.name.substr(0, name.length) == name)) && checkbox.type == 'checkbox' && checkbox.checked == false)
		{
			mainChecked = false;
		}
	}
	form.allbox.checked = mainChecked;
}