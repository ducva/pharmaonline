<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<script language="javascript">
	function Trim(obj)
	{
		var regFirstSpace = /^\s/;
		var regLastSpace = /\s$/;
		while(regFirstSpace.test(obj.value))
		{
			obj.value = obj.value.replace(regFirstSpace, "");
		}
		while(regLastSpace.test(obj.value))
		{
			obj.value = obj.value.replace(regLastSpace, "");
		}
	}
	function CheckNull(obj)
	{
		var regDoubleSpace = /\s\s/;
		while(regDoubleSpace.test(obj.value))
		{
			obj.value = obj.value.replace(regDoubleSpace, " ");
		}	
		Trim(obj);
		if(obj.value == "")
		{
			return false;
		}
		return true;
	}
	function CheckName(obj)
	{
		var regDoubleSpace = /\s\s/;
		var regSpecialChar = /[`~!@#$%^&*()\-+=|\][}{;:'"\\/?.>,<]/;
		while(regDoubleSpace.test(obj.value))
		{
			obj.value = obj.value.replace(regDoubleSpace, " ");
		}	
		Trim(obj);
		if(obj.value == "" || regSpecialChar.test(obj.value))
		{
			return false;
		}
		return true;
	}	
	function CheckUserPass(obj)
	{
		var regSpecialChar = /^\w+$/;
		if(!obj.value.match(regSpecialChar))
		{
			return false;
		}
		return true;
	}	
	function CheckEmail(obj)
	{
		var regEmail = /^\w+(\.\w+)*@(\w+\.)+[a-zA-Z]{2,7}$/;
		if(!obj.value.match(regEmail))
		{
			alert('Email không hợp lệ!');
			return false;
		}
		return true;
	}
	function CheckNumber(obj)
	{
		var regNumber = /^\d+$/;
		if(!obj.value.match(regNumber))
		{
			return false;
		}
		return true;
	}
	function CheckConfig(obj)
	{
		
		if(!CheckNumber(obj.txtMoney))
		{
			alert('Tiền không hợp lệ!');
			return false;
		}
		if(!CheckUserPass(obj.txtYahooMessenger))
		{
			alert('Yahoo Messenger không hợp lệ!');
			return false;
		}
		if(!CheckUserPass(obj.txtSkype))
		{
			alert('Skype không hợp lệ!');
			return false;
		}
		if(!CheckEmail(obj.txtEmail))
			return false;
		if(!CheckUserPass(obj.txtHotLine))
		{
			alert('Số đường dây nóng không hợp lệ!');
			return false;
		}
		if(!CheckUserPass(obj.txtFax))
		{
			alert('Số Fax không hợp lệ!');
			return false;
		}
		if(!CheckUserPass(obj.txtTelephone))
		{
			alert('Số điện thoại không hợp lệ!');
			return false;
		}
		return true;
	}
</script>

<TABLE width="100%" cellPadding=0 cellSpacing=0 class=center>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post" onsubmit="return CheckConfig(this);">
      		<TABLE width="100%" cellPadding=0 cellSpacing=0 class=main>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị hệ thống QTM-GROUP </SPAN></TD>
							</TR>
							</TBODY>
							</TABLE>
            				<TABLE width="100%" class=content>
             				<TBODY>
              				<TR>
								<TD>
                  					<TABLE class=header cellSpacing=0 cellPadding=0>
									<TBODY>
									<TR>
										<TH>Sửa cấu hình hệ thống</TH>
									</TR>
									</TBODY>
									</TABLE>
                  				</TD>	
							</TR>
              				<TR>
                				<TD>
                  					<TABLE width="100%">
									<TBODY>
									<TR>
									  <TD vAlign=bottom align=right width="100%">
									  	<A title="Danh sách" href="#"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
										<A title="Cập nhập dữ liệu" onclick=window.location.reload(); 
href="#"><IMG class=icon src="images/refresh.gif"></A> 
										<A title="Giúp đỡ" href="#" target=_blank><IMG class=icon src="images/help.gif"></A>                      
									  </TD>
									</TR>
									</TBODY>
									</TABLE>
                  					<TABLE width="90%" class=form>
									<TBODY>
									
									<TR>
								  		<TH>Tiền tương ứng với 1 điểm :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT  type="text" style="WIDTH: 100px; text-align: right;" name="txtMoney" value="{MAIN.Money}"> <strong>đồng</strong></TD>
									</TR>
									<TR>
								  		<TH>Yahoo Messenger :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 200px" type="text"  name="txtYahooMessenger" value="{MAIN.YahooMessenger}"></TD>
									</TR>
									<TR>
								  		<TH>Skype :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 200px" type="text"  name="txtSkype" value="{MAIN.Skype}"></TD>
									</TR>
									<TR>
								  		<TH>Email :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtEmail"  type="text" style="WIDTH: 200px" value="{MAIN.Email}"></TD>
									</TR>
									<TR>
								  		<TH>Đường dây nóng :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtHotLine" type="text" style="WIDTH: 200px" value="{MAIN.HotLine}"></TD>
									</TR>
									<TR>
								  		<TH>Fax :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtFax" type="text" style="WIDTH: 200px" value="{MAIN.Fax}"></TD>
									</TR>
									<TR>
								  		<TH>Điện thoại :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtTelephone" type="text" style="WIDTH: 200px" value="{MAIN.Telephone}"></TD>
									</TR>
									
									
									</TBODY>
								  </TABLE>
                  					<BR>
									
									<TABLE class=page>
									<TBODY>
									<TR>
								  		<TD><INPUT class=button type=submit value="Đồng ý" name="btnSubmit"> <INPUT class=button type=reset value="Nhập lại"> <INPUT class=button onclick=javascript:history.go(-1) type=button value="Quay lại"> 
								  		</TD>
									</TR>
									</TBODY>
									</TABLE>
									
								</TD>
							</TR>
							</TBODY>
						  </TABLE>
						</TD>
					</TR>
				</TBODY>
			  </TABLE>
			</FORM>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<!-- END: MAIN -->