<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber5">
  <tr>
	<td width="100%" align="center" valign="top">
		<script>Flashwrite("flash/button.swf",570,49);</script>
	</td>
  </tr>
  
<!-- BEGIN: MIDDLEADV -->  
  <tr>
	<td width="100%" align="center" valign="top">
		{MIDDLEADV}
	</td>
  </tr>
<!-- END: MIDDLEADV -->
  
  <tr width="570">
	<td width="570" height="50" align="center" background="images/Main_06.jpg">
	
<form action="" name="frmSearch" method="get" style="margin-top:5px;">
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="98%" id="AutoNumber7">
	  <tr style="font-family:Arial,Helvetica,sans-serif; font-size:10pt;color:#333333;">
	    <td width="14%" align="left" valign="middle">Tìm kiếm</td>
		<td width="15%" align="left" valign="middle"><FONT color=#006633> 
		  <input type="hidden" name="page" value="product" />
		  <INPUT class=hd_form maxLength=40 size=10 name=keyword> 
		  </FONT></td>
		<td width="15%" align="right" style="padding-right:5px;">Danh mục </td>
		<td width="23%" align="left">
			<SELECT name=catid> 
				<OPTION value=0 selected>---- Tất cả ----</OPTION> 
			<!-- BEGIN: CBOCATEGORY -->	
				<OPTION value="{CBOCATEGORY.ID}">{CBOCATEGORY.NAME}</OPTION>
		  	<!-- END: CBOCATEGORY -->
		  	</SELECT>
		</td>
		<td width="15%" align="left" style="padding-left:3px;">
			<INPUT title=" Tìm kiếm " onclick="this.form.submit()" type=image src="images/button_go.jpg"></td>
		<td width="17%" align="center"><img border="0" src="images/english-iso-8859-1.gif" width="36" height="25">
		<img border="0" src="images/vietnamese-utf-8.gif" width="36" height="25"></td>
	  </tr>
	</table>
</form>

	</td>
  </tr>
</table>
<!-- END: MAIN -->