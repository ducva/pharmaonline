<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="?page=member&do=list" name="frmMember" method="post">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị nhà phân phối QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách các nhà phân phối trong hệ thống</TH>
									</TR>
									</TBODY>
									</TABLE>
                  				</TD>	
							</TR>
              				<TR>
                				<TD>
                  					<TABLE class=search>
                    				<TBODY>
                    				<TR>
                      					<TD align=right width="5%"><IMG class=icon src="images/search.gif"> 
                      					</TD>
                      					<TD align=middle width="65%">
                        					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          					<TBODY>
                          					<TR>
                            					<TH>Tên :</TH>
                            					<TD><INPUT style="WIDTH: 200px" name=txtKeyword></TD>
											</TR>
                          					<TR>
                            					<TH></TH>
                            					<TD><INPUT class=button type=submit value="Tìm kiếm"> 
<INPUT class=button type=reset value="Nhập lại"> 
                            					</TD>
											</TR>
											</TBODY>
											</TABLE>
										</TD>
                      					<TD vAlign=bottom align=right width="30%">
											<A title="Danh sách danh mục sản phẩm" href="?page=provider&do=list">
												<IMG src="images/list.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Thêm mới" href="?page=provider&do=add">
												<IMG src="images/add.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Cập nhập dữ liệu" onclick=window.location.reload(); href="#">
												<IMG class=icon src="images/refresh.gif"></A> 
                        					<A title="Giúp đỡ" href="#" target=_blank>
												<IMG class=icon src="images/help.gif"></A>                      					</TD>
									</TR>
									</TBODY>
									</TABLE>
									
                  					<TABLE class=table cellSpacing=1 cellPadding=4>
									<TBODY>
									<TR>
										  <TH width="10%">Mã</TH>
										  <TH width="20%">Tên nhà phân phối </TH>
										  <th width="15%">Website</th>
										  <th width="10%">Địa chỉ </th>
										  <th width="15%">Vị trí </th>
										  <TH width="10%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTPROVIDER -->
									<TR  onmouseover=change_color(this,6) onmouseout=delete_color(this,6)>
                      					<TD align=middle>{LISTPROVIDER.ID}</TD>
                     					<TD align=left>&nbsp;&nbsp;&nbsp;&nbsp;
										 	<IMG src="images/root.gif">&nbsp;{LISTPROVIDER.NAME} 										</TD>
                      					<td align="middle">{LISTPROVIDER.WEBSITE}</td>
                      					<td align="middle">{LISTPROVIDER.ADDRESS}</td>
                      					<td align="middle">{LISTPROVIDER.UP}</td>
                      					<TD align=middle>
											<A title=Khóa href="?page=provider&do=list&action=status&id={LISTPROVIDER.ID}&status={LISTPROVIDER.STATUS}">
												<IMG class=icon src="{LISTPROVIDER.LOCK}"></A>&nbsp;
											<A title=Sửa href="?page=provider&do=edit&id={LISTPROVIDER.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTPROVIDER.NAME}\' ?')" href="?page=provider&do=list&action=delete&id={LISTPROVIDER.ID}">
												<IMG class=icon src="images/delete.gif"></A>										</TD>
									</TR>
									<!-- END: LISTPROVIDER -->
									</TBODY>
									</TABLE>
                  					<BR>
                  					<TABLE class=page>
									<TBODY>
									<TR>
                      					<TD>
											{PAGING}
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