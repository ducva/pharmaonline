<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#E4E4E4" width="98%" id="AutoNumber12">
  <tr><td width="50%"></td><td width="50%"></td></tr>
  <tr>
    <td width="100%" height="25" colspan="2" align="left" valign="middle" class="lnkdirect1">
		{TOOLBAR}	
	</td>
  </tr>
  <!-- BEGIN: PRODUCTROW -->
  
  <!-- BEGIN: NOPRODUCT -->
	<tr>
	  <td align="center" valign="middle" colspan="2" style="padding:3px;font-family:Arial,Helvetiaca,sans-serif; font-size:10pt;color:#999999;">Không có sản phẩm nào trong mục này </td>
  </tr>
	<!-- END: NOPRODUCT -->
  
  
  <tr>
  
  <!-- BEGIN: PRODUCTCOL -->
	<td width="50%" align="left" valign="top" style="padding:3px;">
		
		<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; font-family:Arial,Helvetica,sans-serif; font-size:10pt;color:#333333;" bordercolor="#111111" width="100%" id="AutoNumber13">
		  <tr>
			<td colspan="3" align="left" valign="top">
				<A href="index.php?page=productdetail&proid={PRODUCTCOL.ID}"><img src="images/upload/product/{PRODUCTCOL.IMAGE}" width="100" hspace="5" vspace="0" align="left" border="0" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10)></A>
			<a href="index.php?page=productdetail&proid={PRODUCTCOL.ID}" class="lnkProName">{PRODUCTCOL.CODE} - {PRODUCTCOL.NAME}</a><br />
			
			{PRODUCTCOL.DESCRIPTION}			
			</td>
		  </tr>
		  {PRODUCTCOL.SALEIMAGE}
		  <tr style="padding-top:10px;">
		    <td width="73%" align="right" valign="top">
			<font color="#006633"><b>Giá bán: {PRODUCTCOL.PRICEQTM} {PRODUCTCOL.CURRENCY}</b></font></td>
			<td width="27%" align="center" valign="top"><a href="index.php?page=cart&do=add&proid={PRODUCTCOL.ID}" style="cursor:hand"><img src="images/order.gif" border="0" align="absmiddle" /></a></td>
		  </tr>
		</table>
		
	</td>
	<!-- END: PRODUCTCOL -->
	
  </tr>
  <!-- END: PRODUCTROW -->
</table>
<div align="right" class="lnkdirect1">{PAGING}</div>
<!-- END: MAIN -->