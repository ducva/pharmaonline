<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="AutoNumber5" style="border-collapse: collapse">
  <tr>
  	<td width="100%" height="25" align="left" valign="middle" class="lnkdirect1">
		{TOOLBAR}	</td>
  </tr>	
  <tr>
    <td width="100%" align="left" valign="top">
		<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" id="AutoNumber9">
		<!-- BEGIN: NEWSCATEGORY -->
      		<tr class="BackgroundColor" >
        		<td width="50%" height="20" align="left" valign="middle" bgcolor="#444444" style="padding-left:3px;font-family:Arial,Helvetiaca,sans-serif; font-size:10pt;color:#999999;">
					<strong><font color="#FFFFFF">{NEWSCATEGORY.NAME}</font></strong>				</td>
        		<td width="50%" align="left" valign="top" bgcolor="#444444" ><p align="right"> <a href="#"></a></td>
      		</tr>
			
			<!-- BEGIN: NONEWS -->
			<tr>
			  <td align="center" valign="middle" colspan="2" style="padding:3px;font-family:Arial,Helvetiaca,sans-serif; font-size:10pt;color:#999999;">Không có tin nào trong mục này </td>
		  </tr>
			<!-- END: NONEWS -->
			
			<!-- BEGIN: LISTNEWS -->
      		<tr>
        		<td width="100%" align="left" valign="top" colspan="2" style="padding:3px;font-family:Arial,Helvetiaca,sans-serif; font-size:10pt;color:#999999;">
					<table border="1" cellpadding="0" cellspacing="0" style="font-family:Arial,Helvetiaca,sans-serif; font-size:10pt;color:#333333; border-collapse:collapse" width="100%" id="AutoNumber10" bordercolor="#EAEAEA">
          				<tr>
            				<td align="left" valign="top" style="padding-top:3px;">
								<a href="index.php?page=newsdetail&newsid={LISTNEWS.ID}"><img src="images/upload/news/thumbs/{LISTNEWS.IMAGE}" width="100" hspace="10" border="0" align="left" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10)></a>
								<a href="index.php?page=newsdetail&newsid={LISTNEWS.ID}" class="newsTitle">{LISTNEWS.TITLE}</a><br>
              					{LISTNEWS.DESCRIPTION}
							  <BR>
							  <DIV align="right" style="padding-right:5px;"><a href="index.php?page=newsdetail&newsid={LISTNEWS.ID}" class="detail">Xem chi tiết <img border="0" src="images/aclosed_1.gif" width="13" height="13"></a></DIV>		 				  </td>
           				</tr>
        			</table>				</td>
      		</tr>
			<!-- END: LISTNEWS -->
		<!-- END: NEWSCATEGORY -->	
    	</table>
		
		
	</td>
  </tr>
</table>
<div align="right" class="lnkdirect1">{PAGING}</div>
<!-- END: MAIN -->