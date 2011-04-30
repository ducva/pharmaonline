<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>New Page 1</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<!-- BEGIN: MAIN -->
<body>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#E9E9E9" width="999" id="AutoNumber1">
    <tr>
      <td align="left" valign="top" colspan="5" height="150">
      <p align="center">
      <img src="images/banner.jpg" width="999" height="150" border="0"></td>
    </tr>
    <tr>
      <td align="left" valign="top" colspan="5" bgcolor="#808080" height="25">
      <p align="center" style="margin-top: 3; margin-bottom: 3"><b>
      <font face="Arial" color="#FFFFFF" style="font-size: 13pt">HÓA ĐƠN CHI TIẾT</font></b></td>
    </tr>
    <tr>
      <td width="14%" align="left" valign="top" bgcolor="#E8F3F9" height="43">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      <font face="Arial" style="font-size: 9pt" color="#666666">
      <img border="0" src="images/icon_r.gif" width="15" height="15"> Mã người mua : </font><font face="Arial" style="font-size: 9pt">
      </font></b><font face="Arial" size="2">{MAIN.Id} </font> </td>
      <td width="26%" align="left" valign="top" bgcolor="#E8F3F9" height="43">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      <font face="Arial" style="font-size: 9pt" color="#666666">
      <img border="0" src="images/icon_group.gif" width="15" height="15"> Tên người mua:
      </font></b><font face="Arial" size="2">{MAIN.Fullname} </font></td>
      <td width="20%" align="left" valign="top" bgcolor="#E8F3F9" height="43">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <img border="0" src="images/telephone.png" width="15" height="15"><b><font face="Arial" style="font-size: 9pt" color="#666666">Điện thoại: </font></b><font face="Arial" size="2">{MAIN.Telephone}</font></td>
      <td width="20%" align="left" valign="top" bgcolor="#E8F3F9" height="43">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      <font face="Arial" style="font-size: 9pt" color="#666666">
      <img border="0" src="images/icon_p.gif" width="15" height="15"> Ngày mua: </font>
      </b><font face="Arial" size="2">{MAIN.CreateDate}</font></td>
      <td width="20%" align="left" valign="top" bgcolor="#E8F3F9" height="43">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      <font face="Arial" style="font-size: 9pt" color="#666666">Số hóa đơn:</font></b>&nbsp;&nbsp;
      <font color="#FF0000">[ <b>{MAIN.OrderId}</b>]</font></td>
    </tr>
    <tr style="font-family:Arial, Helvetica, sans-serif; font-size:9pt; color:#FFFFFF" bgcolor="#333333">
      <td width="14%" align="center" valign="top" height="21">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
     Mã hàng</b></td>
      <td width="26%" align="center" valign="top" height="21">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      Tên hàng</b></td>
      <td width="20%" align="center" valign="top" height="21">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      Giá tiền 
      </b></td>
      <td width="20%" align="center" valign="top" height="21">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      Số lượng</b></td>
      <td width="20%" align="center" valign="top" height="21">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3"><b>
      Tiền</b></td>
    </tr>
    <!-- BEGIN: LISTDETAIL -->
    <tr>
      <td width="14%" align="center" valign="top" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <font face="Arial" style="font-size: 10pt">{LISTDETAIL.Code}</font></td>
      <td width="26%" align="left" valign="top" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <font face="Arial" size="2">{LISTDETAIL.Name}</font></td>
      <td width="20%" align="center" valign="top" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <font face="Arial" size="2">{LISTDETAIL.PriceQTM}</font></td>
      <td width="20%" align="center" valign="top" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <font face="Arial" size="2">{LISTDETAIL.Quantity}</font></td>
      <td width="20%" align="center" valign="top" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <font face="Arial" size="2">{LISTDETAIL.Money}</font></td>
    </tr>
    <!-- END: LISTDETAIL -->
    <tr>
      <td align="left" valign="top" colspan="4" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3" align="right">
      <b><font face="Arial" style="font-size: 9pt" color="#666666">Tổng tiền:&nbsp;&nbsp;&nbsp;
      </font></b></td>
      <td width="20%" align="center" valign="top" height="25">
      <p style="margin-left: 4; margin-top: 3; margin-bottom: 3">
      <b>
      <font color="#FF0000" face="Arial" style="font-size: 11pt">{MAIN.Money} </font>
      </b></td>
    </tr>
    <tr>
      <td align="left" valign="top" height="17" colspan="5">
      <p align="right" style="margin-right: 10"><b>
      <font face="Arial" style="font-size: 9pt" color="#666666">Hà nội,&nbsp;&nbsp;</font>
      <font face="Arial" color="#666666"><span style="font-size: 9pt">Ngày&nbsp;
      </span></font><span style="font-size: 9pt">
      <font face="Arial" color="#666666">{MAIN.Day} Tháng {MAIN.Month} Năm</font></span><font face="Arial" color="#666666"><span style="font-size: 9pt"> {MAIN.Year}</span></font></b></td>
    </tr>
    
    <tr>
      <td align="left" valign="top" height="19" colspan="3" bordercolor="#FFFFFF">
      <p align="right" style="margin-right: 5">
      <font face="Arial" color="#666666" style="font-size: 9pt"><b>Người mua hàng:</b></font></td>
      <td align="left" valign="top" height="19" colspan="2" bordercolor="#FFFFFF">
      <p align="right" style="margin-right: 30">
      <font face="Arial" color="#666666" style="font-size: 9pt"><b>&nbsp;Người giao hàng: </b></font></p>
      <p align="right" style="margin-right: 30">&nbsp;</p>
     <p align="right" style="margin-right: 30">&nbsp;</p>
      <p align="right" style="margin-right: 30"></td>
    </tr>
  </table>
 	<TABLE border="0" cellpadding="0" cellspacing="0" width="100%">
		<TR>
			<TD style="padding-right:20px;" align="right" >
				<INPUT type=button value="Quay lại" name="btn" onClick="history.go(-1);">&nbsp;
				<INPUT type=button value="Print" name="btnSubmit" onClick="window.print();">
		  </TD>
		</TR>
	</TABLE>
  </center>
</div>

</body>
<!-- END: MAIN -->
</html>