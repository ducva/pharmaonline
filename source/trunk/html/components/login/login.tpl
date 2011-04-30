<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
  <tr style="font-family:Arial,Helvetica,sans-serif; font-size:10pt;color:#333333;">
	<td width="211" height="31" align="center" valign="top" background="images/button_04_1.jpg">
	<p style="margin-top: 7"><font color="#FFFFFF"><b>{TITLE}</b></font></td>
  </tr>
  <tr>
	<td width="211" align="center" valign="top" background="images/button_06.jpg">
	
	<!-- BEGIN: LOGINNO -->
		<form action="" name="frmLogin" method="post" style="margin:0px">
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber11">
			 <tr>
				<td width="48%" align="left" valign="top" style="padding-left:10px;font-family:Arial, Helvetica, sans-serif; font-size:12px;">
					Tên đăng nhập		
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="text" name="txtUsername" style="width:150px;">
				</td>
			 </tr>	
			 <tr>
				<td width="48%" align="left" valign="top" style="padding-left:10px;font-family:Arial, Helvetica, sans-serif; font-size:12px;">
					Mật khẩu		
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="password" name="txtPassword" style="width:150px;">
				</td>
			 </tr>
			<tr>
				<td align="center" style="padding-top:5px;">
					<input type="submit" name="btnLogin" value="Đăng nhập"> <input type="reset" name="btnReset" value="Nhập lại" />
				</td>
			 </tr>	
			 <tr>
				<td align="center" valign="middle" style="padding-top:10px;">
					<a href="index.php?page=register" class="lnkProname">Đăng ký thành viên</a>
				</td>
			 </tr>	  
			</table>
		</form>	
	<!-- END: LOGINNO -->
	
	<!-- BEGIN: LOGINYES -->
		<table width="100%" cellpadding="0" cellspacing="0"  style="font-family:Arial,Helvetica,sans-serif; font-size:9pt;">
		
			<tr>
				<td height="30" style="padding-left:10px;"><img src="images/likeuser.gif" align="absmiddle" /> {FULLNAME} ({USERNAME})</td>
			</tr>
			<tr>
			  <td height="30" style="padding-left:10px;"><img src="images/call.jpg" align="absmiddle" /> {TELEPHONE}</td>
			</tr>
			<tr>
			  <td height="30" style="padding-left:10px;"><img src="images/mobile.png" align="absmiddle" /> {MOBILE}</td>
			</tr>
			<tr>
			  <td style="padding-left:10px;"><img src="images/calendar.gif" alt="Ngày đăng ký" align="absmiddle" /> Tham gia: {JOINDATE}</td>
			</tr>
			<tr>
			  <td height="30" style="padding-left:10px;"><img src="images/calendar.gif" alt="Ngày đăng ký" align="absmiddle" /> Mã số của bạn: <span style="font-family:Arial, Helvetica, sans-serif; font-size:20px; font-weight:bold; color:#FF6600">{ID}</span></td>
			</tr>
			<tr>
			  <td style="padding-left:10px; padding-top:5px;">Tổng tiền mua trong tháng {MONTH}:</td>
		  </tr>
			<tr>
			  <td style="padding-top:5px; font-family:Arial, Helvetica, sans-serif; font-size:20px; font-weight:bold" align="center">{TOTALMONEY} VNĐ </td>
		  </tr>
			<tr>
			  <td style="padding-left:10px; padding-top:5px;">Tổng tiền mua hiện tại: </td>
		  </tr>
		  
			<tr>
			  <td style="padding-top:5px; font-family:Arial, Helvetica, sans-serif; font-size:20px; font-weight:bold; color:#FF6600" align="center">{CURRENTMONEY} VNĐ</td>
		  </tr>
			<tr>
			  <td height="30" align="center">
			  	<a href="index.php?page=cart&amp;do=view"><img src="images/cart.gif" border="0" /></a>			  </td>
		  </tr>
		  <tr>
			  <td height="30" align="center"><a href="tree.php?id={ID}" class="lnkProname" target="_blank">Thành viên bạn giới thiệu</a></td>
		  </tr>
			<tr>
			  <td height="30" align="center"><a href="?page=buy" class="lnkProname">Mua hàng theo mã sản phẩm</a></td>
		  </tr>
			<tr>
			  <td height="30" align="center">
			  <a href="?do=logout" onclick="javascript:AjaxResponse('ajaxfiles/login.php?action=logout','PlaceLogin');	" class="lnkProname">Đổi mật khẩu</a>&nbsp;&nbsp;
			  <a href="?do=logout" onclick="javascript:AjaxResponse('ajaxfiles/login.php?action=logout','PlaceLogin');	" class="lnkProname">Đăng xuất</a></td>
			</tr>
		</table>
	<!-- END: LOGINYES -->
			
	</td>
  </tr>
  <tr>
	<td width="211" height="11" align="center" valign="top" background="images/button_07.jpg"></td>
  </tr>
</table>
<!-- END: MAIN -->