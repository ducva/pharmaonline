<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="?page=rules&do=list" name="frmRules" method="post">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị qui định QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách các qui định trong hệ thống</TH>
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
											<A title="Danh sách tin tức" href="?page=rules&do=list">
												<IMG src="images/list.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Thêm mới" href="?page=rules&do=add">
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
										  <TH width="5%">Mã</TH>
										  <TH width="50%">Tên qui định </TH>
										  <th width="15%">Ngày viết </th>
										  <TH width="10%">Vị trí </TH>
										  <TH width="10%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTRULES -->
									<TR  onmouseover=change_color(this,7) onmouseout=delete_color(this,7)>
                      					<TD align=middle>{LISTRULES.ID}</TD>
                     					<TD align=left style="padding-left:5px;">{LISTRULES.NAME} 										</TD>
                      					<td align="middle">{LISTRULES.WRITEDATE}</td>
                      					<TD align=center>
											<table width="60%" cellpadding="0" cellspacing="0">
												<tr>
													<td width="50%">{LISTRULES.UP}</td>
													<td width="50%">{LISTRULES.DOWN}</td>
												</tr>
										  </table>
										</TD>
                      					<TD align=middle>
											<A title=Khóa href="?page=rules&do=list&action=status&id={LISTRULES.ID}&status={LISTRULES.STATUS}">
												<IMG class=icon src="{LISTRULES.LOCK}"></A>&nbsp;
											<A title=Sửa href="?page=rules&do=edit&id={LISTRULES.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa qui định này ?')" href="?page=rules&do=list&action=delete&id={LISTRULES.ID}">
												<IMG class=icon src="images/delete.gif"></A>										</TD>
									</TR>
									<!-- END: LISTNEWS -->
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