<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<link rel="stylesheet" href="css/sm.css" />
<script type="text/javascript">
function Check()
{
	if(document.frmCart.txtPlace.value=='')
	{
		alert('Bạn chưa ghi rõ địa chỉ giao hàng');
		document.frmCart.txtPlace.focus();
		return false;
	}
	else
	{
		confirm('Bạn có chắc chắn muốn mua những sản phẩm này?');window.location.href='index.php?page=cart&do=order&address=' + document.frmCart.cboHour.value + 'h ngày ' + document.frmCart.cboDay.value + ' tháng ' + document.frmCart.cboMonth.value + ' năm ' + document.frmCart.cboYear.value + ', tại ' + document.frmCart.txtPlace.value;
		return true;
	}
}
</script>
{MESSAGE}

<table id="Table2" cellspacing="0" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td valign="top">
        
          <span class="lnkdirect1">Mua hàng theo mã sản phẩm</span> <br />
          <table cellpadding="0" cellspacing="0" width="100%">
		  	
		  	<tr>
				<td width="16%" class="cellCartTotalCast">
					Mã sản phẩm				</td>
				<td width="27%">
			  <input type="text" name="txtCode_1" style="width:150px;" />		  	  </td>
				<td colspan="2" align="left">
			      <input type="button" name="btnCheck" value="Kiểm tra và đặt hàng" onclick="Reload_Body('ajax/checkproductcode.php?code='+txtCode_1.value,'Result')" />			  	</td>
			</tr>
			<tr>
			  <td height="25" valign="top" class="cellCartTotalCast">Kết quả </td>
			  <td colspan="2" valign="middle"><div id="Result"></div></td>
			 
			  <td width="35%" align="center">&nbsp;</td>
		    </tr>
			<tr>
		  	  <td class="cellCartTotalCast">&nbsp;</td>
		  	  <td>&nbsp;</td>
		  	  <td width="22%" align="right">&nbsp;</td>
		  	  <td align="center">&nbsp;</td>
	  	    </tr><tr>
		  	  <td class="cellCartTotalCast">&nbsp;</td>
		  	  <td colspan="2"><input type="button" name="btnAddToCart" value="Xem giỏ hàng" onclick="window.location='?page=cart&do=view';" /> 
		  	  <input type="button" name="btnReturn" value="Quay lại" onclick="history.go(-1);" /></td>
		  	  <td align="center">&nbsp;</td>
	  	    </tr>
		  </table>
        
      </td>
    </tr>
	
  </tbody>
</table>
<!-- END: MAIN -->