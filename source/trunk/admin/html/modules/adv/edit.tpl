<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<script language="javascript">
	function CheckName(obj, name)
	{
		var regFirstSpace = /^\s/;
		var regLastSpace = /\s$/;
		var regDoubleSpace = /\s\s/;
		var regSpecialChar = /[`~!@#$%^&*()\-+=|\][}{;:'"\\/?.>,<]/;
		while(regDoubleSpace.test(obj.value))
		{
			obj.value = obj.value.replace(regDoubleSpace, " ");
		}
		if(regFirstSpace.test(obj.value))
			obj.value = obj.value.replace(regFirstSpace, "");
		if(regLastSpace.test(obj.value))
			obj.value = obj.value.replace(regLastSpace, "");
		if(obj.value == "" || regSpecialChar.test(obj.value))
		{
			alert('Chưa nhập '+name+' hoặc '+name+' không hợp lệ!');
			return false;
		}
		return true;
	}	
	function CheckNull(obj, name)
	{
		if(obj.value == "")
		{
			alert('Chưa chọn '+name+'!');
			return false;
		}
		return true;
	}
	function CheckAdv(obj)
	{
		if(!CheckName(obj.txtAdvName, 'tên'))
			return false;
		if(!CheckNull(obj.cboAdvPosition, 'vị trí'))
			return false;
		if(!CheckNull(obj.txtAdvLink, 'URL'))
			return false;
		return true;
	}
</script>
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post" enctype="multipart/form-data" onsubmit="return CheckAdv(this);">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị quảng cáo</SPAN></TD>
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
										<TH>Thay đổi thông tin quảng cáo</TH>
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
									  	<A title="Danh sách" href="?page=adv&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
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
								  		<TH>Tên quảng cáo :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT type="text" style="WIDTH: 200px" name="txtAdvName" value="{MAIN.NAME}"></TD>
									</TR>
									<TR>
								  		<TH>Vị trí :<SPAN class=note>*</SPAN></TH>
								  		<TD>
								  			<select name="cboAdvPosition">
								  				<option value="">.: Vị trí :.</option>
								  				<option value="1" {MAIN.SELECTED1}>Trái</option>
								  				<option value="2" {MAIN.SELECTED2}>Phải</option>
								  				<option value="3" {MAIN.SELECTED3}>Trên</option>
								  				<option value="4" {MAIN.SELECTED4}>Giữa</option>
								  				<option value="5" {MAIN.SELECTED5}>Dưới</option>
								  			</select>
								  		</TD>
									</TR>
									<TR>
								  		<TH>Trạng thái :<SPAN class=note>*</SPAN></TH>
								  		<TD>
								  			<input type="radio" name="radAdvStatus" value="0" {MAIN.CHECKED0} id="hide">
								  			<label for="hide">Ẩn</label>&nbsp;&nbsp;&nbsp;&nbsp;
								  			<input type="radio" name="radAdvStatus" value="1" {MAIN.CHECKED1} id="display">
								  			<label for="display">Hiện</label>
								  		</TD>
									</TR>
									<TR >
								  		<TH>URL :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT type="text" style="WIDTH: 200px" name="txtAdvLink" value="{MAIN.LINK}"></TD>
									</TR>
									<TR>
								  		<TH>Ảnh hiện tại :<SPAN class=note>*</SPAN></TH>
								  		<TD>
								  			{FILE}
								  		</TD>
									</TR>
									<TR>
								  		<TH>File :<SPAN class=note>*</SPAN></TH>
								  		<TD>
								  			<INPUT type="file" style="WIDTH: 200px" name="txtAdvFile">
								  		</TD>
									</TR>
									</TBODY>
									</TABLE>
                  					<BR>
									
									<TABLE class=page>
									<TBODY>
									<TR>
								  		<TD>
								  			<INPUT class=button type=submit value="Đồng ý" name="btnSubmit">
								  		 	<INPUT class=button type=reset value="Nhập lại"> 
								  		 	<INPUT class=button onclick=javascript:history.go(-1) type=button value="Quay lại"> 
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