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
	function CheckUser(obj)
	{
		if(!CheckName(obj.txtFullname))
		{
			alert('Họ và tên không hợp lệ!');
			return false;
		}	
		if(!CheckNull(obj.txtAddress))
		{
			alert('Chưa nhập địa chỉ!');
			return false;
		}	
		if(!CheckNull(obj.txtRootId))
		{
			alert('Mã người giới thiệu!');
			return false;
		}	
		if(!CheckUserPass(obj.txtUsername))
		{
			alert('Tên đăng nhập không hợp lệ!');
			return false;
		}
		if(obj.txtPassword.value != '')	
		{
			if(!CheckUserPass(obj.txtPassword))
			{
				alert('Mật khẩu không hợp lệ!');
				return false;
			}
		}	
		if(obj.txtPassword.value != obj.txtConfirmPassword.value)
		{
			alert('Xác nhận mật khẩu không chính xác!');
			return false;
		}
		if(!CheckEmail(obj.txtEmail))
			return false;
		if(!CheckNumber(obj.txtTelephone))
		{
			alert('Số điện thoại không hợp lệ!');
			return false;
		}
		if(!CheckNumber(obj.txtMobile))
		{
			alert('Số di động không hợp lệ!');
			return false;
		}
		return true;
	}
</script>

<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post" onsubmit="return CheckUser(this);">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị thành viên QTM-GROUP </SPAN></TD>
							</TR>
							</TBODY>
							</TABLE>
            				<TABLE class=content>
             				<TBODY>
              				<TR>
								<TD>
                  					<TABLE class=header cellSpacing=0 cellPadding=0>
									<TBODY>
									<TR>
										<TH>Sửa thông tin thành viên</TH>
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
									  	<A title="Danh sách" href="?page=member&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
										<A title="Cập nhập dữ liệu" onclick=window.location.reload(); 
href="#"><IMG class=icon src="images/refresh.gif"></A> 
										<A title="Giúp đỡ" href="#" target=_blank><IMG class=icon src="images/help.gif"></A>                      
										</TD>
									</TR>
									</TBODY>
									</TABLE>
                  					<TABLE class=form>
									<TBODY>
									<TR>
								  		<TH>Họ và tên :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtFullname" id="txtFullname" style="WIDTH: 300px;" value="{MAIN.FULLNAME}"></TD>
									</TR>
									<TR>
								  		<TH>Địa chỉ :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 400px" name="txtAddress" value="{MAIN.ADDRESS}"></TD>
									</TR>
									<TR>
								  		<TH>Mã người giới thiệu :<SPAN class=note>*</SPAN></TH>
								  		<TD><input style="WIDTH: 50px; text-align: right;" name="txtRootId" value="{MAIN.ROOTID}"/>{MAIN.WRONGROOTID}</TD>
									</TR>
									<TR>
								  		<TH>Tên truy cập :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 200px;" name="txtUsername" maxlength="20" value="{MAIN.USERNAME}">{MAIN.WRONGUSERNAME}</TD>
									</TR>
									<TR>
								  		<TH>Mật khẩu :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT type="password" style="WIDTH: 200px" name="txtPassword" maxlength="20"></TD>
									</TR>
									<TR>
								  		<TH>Xác nhận mật khẩu :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT type="password" style="WIDTH: 200px" name="txtConfirmPassword" maxlength="20"></TD>
									</TR>
									<TR>
								  		<TH>Ngày sinh :<SPAN class=note>*</SPAN></TH>
								  		<TD>
								  			<select name="cboDay">
											<!-- BEGIN: DAY -->
								  				<option value="{DAY.VALUE}" {DAY.DAY}>{DAY.NAME}</option>
											<!-- END: DAY -->
								  			</select> 
								  			tháng 
								  		    <select name="cboMonth">
                                              <!-- BEGIN: MONTH -->
                                              <option value="{MONTH.VALUE}" {MONTH.MONTH}>{MONTH.NAME}</option>
                                              <!-- END: MONTH -->
                                            </select> 
								  		    năm 
								  		    <select name="cboYear">
                                              <!-- BEGIN: YEAR -->
                                              <option value="{YEAR.VALUE}" {YEAR.YEAR}>{YEAR.NAME}</option>
                                              <!-- END: YEAR -->
                                            </select></TD>
									</TR>
									<TR>
								  		<TH>Email :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtEmail" type="text" id="txtEmail" style="WIDTH: 200px" value="{MAIN.EMAIL}"></TD>
									</TR>
									<TR>
								  		<TH>Điện thoại :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtTelephone" type="text" id="txtTelephone" style="WIDTH: 200px" value="{MAIN.TELEPHONE}"></TD>
									</TR>
									<TR>
								  		<TH>Mobile :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtMobile" type="text" id="txtMobile" style="WIDTH: 200px" value="{MAIN.MOBILE}"></TD>
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