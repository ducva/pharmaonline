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
		if(!CheckNumber(obj.txtmemberId))
		{
			alert('Mã người mua không hợp lệ!');
			return false;
		}
		if(!CheckNumber(obj.txtMoney))
		{
			alert('Tiền không hợp lệ!');
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
								<TD width="95%"><SPAN class=title>Quản trị hóa đơn QTM-GROUP </SPAN></TD>
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
										<TH>Thêm mới hóa đơn vào hệ thống</TH>
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
									  	<A title="Danh sách" href="?page=orders&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
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
								  		<TH>Mã người mua :<SPAN class=note>*</SPAN></TH>
								  		<TD><input style="WIDTH: 50px; text-align: right;" name="txtmemberId" value="{MAIN.memberId}"/>{MAIN.WRONGmemberId}</TD>
									</TR>
									
									<TR>
								  		<TH>Tổng tiền :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtMoney" type="text" id="txtMoney" style="WIDTH: 100px; text-align: right;" value="{MAIN.Money}"> <b>đồng</b></TD>
									</TR>
									<TR valign="top">
								  		<TH>Tình trạng hóa đơn :<SPAN class=note>*</SPAN></TH>
								  		<TD>
								  		<input type="radio" name="radStatus" value="0" {MAIN.Status0}>Chưa thanh toán
								  		<input type="radio" name="radStatus" value="1" {MAIN.Status1}>Đã thanh toán
								  		
								  		</TD>
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