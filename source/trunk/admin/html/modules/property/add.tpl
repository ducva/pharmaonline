<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị thuộc tính sản phẩmQTM-GROUP </SPAN></TD>
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
										<TH>Thêm thuộc tính cho danh mục sản phẩm</TH>
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
									  	<A title="Danh sách" href="?page=property&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
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
								  		<TH>Tên thuộc tính:<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 660px" name="txtName"></TD>
									</TR>
									<TR>
								  		<TH>Danh mục cha :<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboPropertyId">
												<option value="0">...</option>
												<!-- BEGIN: PROPERTY -->
												<option value="{PROPERTY.ID}">{PROPERTY.NAME}</option>
														
												<!-- END: PROPERTY -->
											</select>	
										</TD>
									</TR>
									<TR>
								  		<TH valign="top">Chi tiết:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD><textarea name="txtDetail" cols="40" rows="3" id="txtDetail"></textarea></TD>
									</TR>
									<TR>
								  		<TH>Đơn vị:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD><INPUT style="WIDTH: 200px" name="txtUnit"></TD>
									</TR>
									<TR>
								  		<TH>Các giá trị:<SPAN class=note>&nbsp;</SPAN></TH>
								  		<TD><INPUT name="txtValue" id="txtValue" style="WIDTH: 400px"></TD>
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