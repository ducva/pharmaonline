<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
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
	function CheckProduct(obj)
	{
		if(!CheckName(obj.txtName))
		{
			alert('Tên sản phẩm không hợp lệ!');
			obj.txtName.focus();
			return false;
		}	
		if(!CheckName(obj.txtCode))
		{
			alert('Mã sản phẩm không hợp lệ!');
			obj.txtCode.focus();
			return false;
		}	
		if(obj.cboCategoryId.value==0)
		{
			alert('Bạn chưa chọn danh mục sản phẩm!');
			obj.cboCategoryId.focus();
			return false;
		}
		if(!CheckNumber(obj.txtPrice))
		{
			alert('Giá thị trường không hợp lệ!');
			obj.txtPrice.focus();
			return false;
		}
		if(!CheckNumber(obj.txtPriceQTM))
		{
			alert('Giá QTM không hợp lệ!');
			obj.txtPriceQTM.focus();
			return false;
		}
		if(obj.cboCurrency.value==0)
		{
			alert('Bạn chưa chọn đơn vị tiền tệ!');
			obj.cboCurrency.focus();
			return false;
		}
		if(obj.cboUnit.value==0)
		{
			alert('Bạn chưa chọn đơn vị tính!');
			obj.cboUnit.focus();
			return false;
		}
		
		var sImageName=obj.txtImage.value;
		var iLeng=sImageName.length;
		if(sImageName.substr(iLeng-3,3) != 'jpg' && sImageName.substr(iLeng-3,3) != 'png' && sImageName.substr(iLeng-3,3) != 'gif')
		{
			alert('Chỉ được upload các file ảnh JPG,PNG,GIF!');
			obj.txtImage.focus();
			return false;
		}	
		return true;
	}
</script>
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post" enctype="multipart/form-data" onsubmit="return CheckProduct(this);">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị sản phẩm QTM-GROUP </SPAN></TD>
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
										<TH>Thêm sản phẩm mới vào hệ thống</TH>
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
									  	<A title="Danh sách" href="?page=product&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
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
								  		<TH>Tên sản phẩm:<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtName" id="txtName" style="WIDTH: 660px"></TD>
									</TR>
									<TR>
								  		<TH>Mã sản phẩm:<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtCode" id="txtCode" style="WIDTH: 300px"></TD>
									</TR>
									<TR>
								  		<TH valign="top">Mô tả ngắn :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD><textarea name="txtDescription" cols="50" rows="5" id="txtInfo"></textarea></TD>
									</TR>
									<TR>
								  		<TH valign="top">Thông tin chi tiết :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD><textarea name="txtDetail" cols="50" rows="5" id="txtInfo"></textarea></TD>
									</TR>
									<TR>
								  		<TH>Thuộc danh mục:<SPAN class=note>&nbsp;&nbsp;</SPAN></TH>
								  		<TD>
											<select id="categoryId" name="cboCategoryId" onchange="Reload_Body('ajax/ajax.php?categoryId='+categoryId.value,'Property')">
												<option value="0">...</option>
												<!-- BEGIN: CATEGORY -->
												<option id="level1" value="{CATEGORY.ID}">{CATEGORY.NAME}</option>
													<!-- BEGIN: CHILDCATEGORY -->
													<option value="{CHILDCATEGORY.ID}"> ---- {CHILDCATEGORY.NAME}</option>	
													<!-- END: CHILDCATEGORY -->
														
												<!-- END: CATEGORY -->
											</select>										</TD>
									</TR>
									<TR>
								  		<TH valign="top">Thuộc tính:<SPAN class=note>*</SPAN></TH>
								  		<TD>
											<DIV id="Property">											</DIV>										</TD>
									</TR>
									<TR>
								  		<TH valign="middle">Giá thị trường:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD valign="middle">
											<input name="txtPrice" type="text" value="0" />									  </TD>
									</TR>
									<TR>
								  		<TH valign="middle">Giá QTM-Group:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD valign="middle">
											<input name="txtPriceQTM" type="text" id="txtPriceQTM" value="0" />									  </TD>
									</TR>
									<TR>
								  		<TH>Tiền tệ  :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboCurrency">
												<option value="0"></option>
												<!-- BEGIN: CURRENCY -->
												<option value="{CURRENCY.VALUE}">{CURRENCY.NAME}</option>
												<!-- END: CURRENCY -->
											</select>										</TD>
									</TR>
									<TR>
								  		<TH>Đơn vị tính  :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboUnit">
												<option value="0"></option>
												<!-- BEGIN: UNIT -->
												<option value="{UNIT.VALUE}">{UNIT.NAME}</option>
												<!-- END: UNIT -->
											</select>										</TD>
									</TR>
									<TR>
								  		<TH>Nhà cung cấp  :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboProvider">
												<option value="0"></option>
												<!-- BEGIN: PROVIDER -->
												<option value="{PROVIDER.VALUE}">{PROVIDER.NAME}</option>
												<!-- END: PROVIDER -->
											</select>										</TD>
									</TR>
									<TR>
								  		<TH>Nhà sản xuất  :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboManufacturer">
												<option value="0"></option>
												<!-- BEGIN: MANUFACTURER -->
												<option value="{MANUFACTURER.VALUE}">{MANUFACTURER.NAME}</option>
												<!-- END: MANUFACTURER -->
											</select>										</TD>
									</TR>
									<TR>
									  <TH>Tiêu chí: <SPAN class=note>&nbsp;</SPAN></TH>
									  <TD>
									  		<input type="radio" name="radHotProduct" value="0" style="border: 0px;" checked>Sản phẩm bình thường
				<input type="radio" name="radHotProduct" value="1" style="border: 0px;" {checked_1}>Sản phẩm khuyến mại
				<input type="radio" name="radHotProduct" value="2" style="border: 0px;" {checked_2}>Sản phẩm tiêu biểu
									  </TD>
									  </TR>
									<TR>
								  		<TH>Ảnh minh họa:</TH>
								  		<TD>
								  		  <input name="txtImage" type="file" id="txtImage" style="width:300px;" />								  		</TD>
									</TR>
									<TR>
								  		<TH>Chú thích ảnh:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD><input name="txtImageNote" id="txtImageNote" style="WIDTH: 660px" /></TD>
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