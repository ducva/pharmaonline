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
	function CheckRate(obj)
	{
		if(!CheckNumber(obj.txtPoint))
		{
			alert('Điểm không hợp lệ!');
			return false;
		}	
		if(!CheckNumber(obj.txtPercent))
		{
			alert('Phần trăm không hợp lệ!');
			return false;
		}	
		if(!confirm('Bạn có chắc muốn sửa?'))
			return false;
		return true;
	}
</script>

<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Lập mức điểm QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách mức điểm</TH>
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
									  	<A title="Thêm mới" href="?page=rate&do=add">
												<IMG src="images/add.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Cập nhập dữ liệu" onclick=window.location.reload(); href="#">
												<IMG class=icon src="images/refresh.gif"></A> 
                        					<A title="Giúp đỡ" href="#" target=_blank>
												<IMG class=icon src="images/help.gif"></A> 
										</TD>
									</TR>
									</TBODY>
									</TABLE>
                  					<TABLE class=table>
									<TBODY>
									<TR>
										  <TH width="10%">STT</TH>
										  <TH width="30%">Điểm</TH>
										  <th width="30%">Phần trăm</th>
										  <th width="30%">Quản trị</th>
										  
									</TR>
									<!-- BEGIN: RATE -->
									<FORM action="" method="post">
									<TR onmouseover=change_color(this,4) onmouseout=delete_color(this,4)>
										<td align="center">{RATE.Number}<INPUT type="hidden" name="txtId" value="{RATE.Id}"></td>
								  		<TD align="center"><INPUT name="txtPoint" style="WIDTH: 100px; text-align:right;" value="{RATE.Point}">
								  		</TD>
										<TD align="center"><INPUT style="WIDTH: 40px; text-align:right;" name="txtPercent" value="{RATE.Percent}"> %
										</TD>
										<td align="center">
											<INPUT class=button type=submit value="Sửa" name="btnSubmit" onclick="return CheckRate(this.form);">
											<INPUT class=button type=reset value="Nhập lại">
											<INPUT class=button type=submit value="Xóa" name="btnSubmit" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
											</td>
									</TR>
									</FORM>
									<!-- END: RATE -->
									
									</TBODY>
									</TABLE>
                  					<BR>
									
									<TABLE class=page>
									<TBODY>
									<TR>
								  		<TD>&nbsp;
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
			
			</TD>
		</TR>
	</TBODY>
</TABLE>
<!-- END: MAIN -->