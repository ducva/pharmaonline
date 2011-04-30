var req;	// Xmlhttp Object
var url;

// Init Xmlhttp Object
function Initialize()
{
	try
	{
		req=new ActiveXObject("Msxml2.XMLHTTP");
	}
	catch(e)
	{
		try
		{
			req=new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch(oc)
		{
			req=null;
		}
	}

	if(!req&&typeof XMLHttpRequest!="undefined")
	{
		req=new XMLHttpRequest();
	}

}

// Display loading while tranfering data , call it before SendQuery function
// name parameter is the name of div tag
function Processing(name)
{
	obj = document.getElementById(name);
	obj.innerHTML = '<table><tr><td><center><img border=0 src="images/loading1.gif" align="absbottom"></center></td></tr></table>';
}

// Display content after data is recieved
// name parameter is the name of div tag
function DisplayContent(name)
{
	obj = document.getElementById(name);
	obj.innerHTML = req.responseText;
}

// Main function
// request parameter is the request which is sent to url
// callbackFunction parameter is the function will process returned data
function SendQuery(url,callbackFunction,method,cache,request)
{
	// Init Object
	Initialize();

	if ( (req!=null) )
	{
		req.onreadystatechange = function()
		{
			// only if req shows "complete"
			if (req.readyState == 4)
			{
				// only if "OK"
				if (req.status == 200)
				{
					// Process
					eval(callbackFunction);
				}
			}
		};
		// Cache data or not , default is yes(1)
		if ( cache != 1 )
		{
			url += "&rand="+Math.random()*1000;
		}

		// Use POST or GET method , default is GET
		if ( method == 'POST' )
		{
			req.open("POST", url, true);
			req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			req.send(request);
		}
		else
		{
			req.open("GET", url , true);
			req.send(null);
		}
	}
}

function Reload_Body(url,name)
{
	Processing(name);
	SendQuery(url,'DisplayContent("'+name+'")');
	return false;
}

