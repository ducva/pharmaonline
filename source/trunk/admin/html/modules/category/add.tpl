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
	
	function CheckCategory(obj)
	{
		if(!CheckName(obj.txtName))
		{
			alert('Tên danh mục không hợp lệ!');
			obj.txtName.focus();
			return false;
		}	
		
		return true;
	}
</script>
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post" onsubmit="return CheckCategory(this);">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị danh mục sản phẩmQTM-GROUP </SPAN></TD>
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
										<TH>Thêm mới  danh mục sản phẩm vào hệ thống</TH>
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
									  	<A title="Danh sách" href="?page=category&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
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
								  		<TH>Tên danh mục:<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 200px" name="txtName"></TD>
									</TR>
									<TR>
								  		<TH>Danh mục cha  :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboRootId">
												<option value="0">...</option>
												<!-- BEGIN: ROOTID -->
												<option value="{ROOTID.ID}">{ROOTID.NAME}</option>
												<!-- END: ROOTID -->
											</select> 
											(Nếu để &quot;...&quot; là danh mục cha) 	
										</TD>
									</TR>
									<TR>
								  		<TH valign="top">Thuộc tính:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
										  <table class="table" style="WIDTH: 660px; BACKGROUND-COLOR: #ffffff" cellspacing="1" cellpadding="4">
                                          	<tbody>
											
												<!-- BEGIN: LISTPROPERTY -->
                                                <tr>
                                                  <td id="level1" align="left" colspan="2"><input style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" type="checkbox" value="{LISTPROPERTY.ID}" name="chkProperty[]" />
                                                      <strong>{LISTPROPERTY.NAME}</strong></td>
                                                </tr>
												
												<!-- BEGIN: LISTCHILDPROPERTY -->
											  <tr onmouseover="change_color(this,2)" onmouseout="delete_color(this,2)">
											    <td width="277" align="left">&nbsp;&nbsp;&nbsp;&nbsp;
														  <input style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" type="checkbox" value="{LISTCHILDPROPERTY.ID}" name="chkProperty[]" />{LISTCHILDPROPERTY.NAME}
												  </td>
													  <td width="362" align="left">{LISTCHILDPROPERTY.UNIT}</td>
											  </tr>
												<!-- END: LISTCHILDPROPERTY -->	
													
											  <!-- END: LISTPROPERTY -->
											  
                                              </tbody>
									    	</table>										
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