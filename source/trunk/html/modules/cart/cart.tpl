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
<form action="index.php?page=cart&do=update" method="post" name="frmCart" id="frmCart">
<table id="Table2" cellspacing="0" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td valign="top">
        
          <span class="lnkdirect1">Giỏ hàng của bạn</span> <br />
          <table class="SMShoppingCartTable" width="98%" align="center">
            <tbody>
              <tr>
                <td><table width="100%" border="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <th width="6%" align="left">Xóa</th>
                      <th width="31%" align="left">Tên sản phẩm </th>
                      <th width="28%">Giá</th>
                      <th width="11%" align="right">Số lượng </th>
                      <th width="24%" align="right">Thành tiền </th>
                    </tr>
					
				<!-- BEGIN: LISTPRODUCT -->
                    <tr>
                      <td class="cellCartRemove"><a href="index.php?page=cart&do=delete&proid={LISTPRODUCT.ID}"><img src="images/ico.remove.gif" align="absmiddle" border="0" /></a> 
					  </td>
                      <td class="cellCartProName">{LISTPRODUCT.NAME}</td>
                      <td align="right" class="cellCartPrice">{LISTPRODUCT.PRICEQTM} {LISTPRODUCT.CURRENCY}</td>
                      <td align="right" class="cellCartEditQty"><input size="3" value="{LISTPRODUCT.QUANTITY}" name="txtQuantity_{LISTPRODUCT.ID}" style="text-align:right;" /></td>
                      <td align="right" class="cellCartProTotal">{LISTPRODUCT.TOTAL} VNĐ</td>
                     </tr>
				<!-- END: LISTPRODUCT -->	
					
				<!-- BEGIN: NOPRODUCT -->	
					<tr>
                      <td class="cellCartTotalCast" align="left" colspan="7">Bạn chưa chọn sản phẩm nào</td>
                    </tr>
				<!-- END: NOPRODUCT -->	
					
					<tr>
                      <td class="cellCartTotalCast" align="right" colspan="7">Thành tiền: {TOTALMONEY} VNĐ</td>
                    </tr>
                  </tbody>
                </table></td>
              </tr>
            </tbody>
          </table>
      </td>
    </tr>
	
	<tr>
      <td valign="top" style="padding-top:10px;">
        
          <span class="lnkdirect1">Thời gian và địa điểm giao hàng </span> <br />
          <table class="SMShoppingCartTable" width="98%" align="center">
            <tbody>
              <tr>
                <td><table width="100%" border="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="13%" class="cellCartTotalCast">
					  	Thời gian :</td>
					  <td width="87%" class="cellCartTotalCast">
					  	<select name="cboHour">
							<!-- BEGIN: CBOHOUR -->
								<option value="{CBOHOUR.VALUE}">{CBOHOUR.NAME}</option>
							<!-- END: CBOHOUR -->
						</select> ngày 
					  	<select name="cboDay">
							<!-- BEGIN: CBODAY -->
								<option value="{CBODAY.VALUE}" {CBODAY.SELECTED}>{CBODAY.NAME}</option>
							<!-- END: CBODAY -->
						</select> tháng
						<select name="cboMonth">
							<!-- BEGIN: CBOMONTH -->
								<option value="{CBOMONTH.VALUE}" {CBOMONTH.SELECTED}>{CBOMONTH.NAME}</option>
							<!-- END: CBOMONTH -->
						</select> năm
						<select name="cboYear">
							<!-- BEGIN: CBOYEAR -->
								<option value="{CBOYEAR.VALUE}" {CBOYEAR.SELECTED}>{CBOYEAR.NAME}</option>
							<!-- END: CBOYEAR -->
						</select>
					  </td>
                    </tr>
					<tr>
                      <td class="cellCartTotalCast">
					  	Địa điểm :</td>
					  <td class="cellCartTotalCast"><input name="txtPlace" type="text" id="txtPlace" style="width:300px;" /></td>
                    </tr>
                  </tbody>
                </table></td>
              </tr>
            </tbody>
          </table>
          <p align="center">
		  	<img src="images/ShopcartButton_01.gif" name="return" id="return" onclick="document.location.href = 'index.php'" style="cursor:hand;" /> 
			
			<img src="images/ShopcartButton_02.gif" name="btnUpdate" id="update1" onclick="document.frmCart.submit();" style="cursor:hand;" /> <input type="hidden" name="hdnSumit" value="1" />
			
			<img src="images/ShopcartButton_03.gif" name="update" id="update" onclick="return Check();" style="cursor:hand;" /> 
		</p>
        
      </td>
    </tr>
	
  </tbody>
</table>
</form>
<!-- END: MAIN -->