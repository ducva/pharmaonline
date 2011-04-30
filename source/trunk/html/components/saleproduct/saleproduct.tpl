<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
  <tr style="font-family:Arial,Helvetica,sans-serif; font-size:10pt;color:#333333;">
	<td width="211" height="31" align="center" valign="top" background="images/button_04_1.jpg">
	<p style="margin-top: 7"><font color="#FFFFFF"><b>Sản phẩm khuyến mại</b></font></td>
  </tr>
  <tr>
	<td width="211" align="center" valign="top" background="images/button_06.jpg">
	
	<marquee  behavior="scroll" direction="up" scrollAmount="1" scrollDelay="10" width="100%" height="170" onmouseover="this.stop()" onmouseout="this.start()">
	
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;font-family:Arial,Helvetica,sans-serif; font-size:10pt;color:#333333;" bordercolor="#111111" width="100%" id="AutoNumber14">
	
	<!-- BEGIN: SALEPRODUCT -->
	  <tr style="padding-top:10px;">
		<td width="40%" align="center" valign="top" >
			<a href="index.php?page=productdetail&proid={SALEPRODUCT.ID}"><img src="images/upload/product/thumbs/{SALEPRODUCT.IMAGE}" width="66" border="0" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10)></a></td>
		<td width="60%" align="left" valign="top">
			<a href="index.php?page=productdetail&proid={SALEPRODUCT.ID}" class="lnkProName">{SALEPRODUCT.NAME}</a>
				<BR>
					Giá thị trường: <strike>{SALEPRODUCT.PRICE} {SALEPRODUCT.CURRENCY}</strike>
				<BR>
					<span class="priceQTM">Giá QTM: {SALEPRODUCT.PRICEQTM} {SALEPRODUCT.CURRENCY}</span>
		</td>
	  </tr>
	 <!-- END: SALEPRODUCT --> 
	 
	  
	</table>
	</marquee>
	</td>
  </tr>
  <!-- BEGIN: CONTINUE -->	
  <tr>
	<td width="211" align="right" style="padding-right:10px; padding-top:5px;" valign="top" background="images/button_06.jpg">
		Xem tiếp
	</td>
  </tr>	
  <!-- END: CONTINUE -->
  <tr>
	<td width="211" height="11" align="center" valign="top" background="images/button_07.jpg"></td>
  </tr>
</table>
<!-- END: MAIN -->