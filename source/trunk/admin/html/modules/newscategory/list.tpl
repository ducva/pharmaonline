<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="?page=newscategory&do=list" name="frmNewsCategory" method="post">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị tin tức QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách tin tức trong hệ thống</TH>
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
											<A title="Danh sách danh mục tin tức" href="?page=newscategory&do=list">
												<IMG src="images/list.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Thêm mới" href="?page=newscategory&do=add">
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
										  <th width="5%">Vị trí </th>
										  <th width="45%">Tên danh mục </th>
										  <TH width="11%">Số bài viết </TH>
										  <TH width="11%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTNEWSCATEGORY -->
									<TR id="level1" onmouseover=change_color(this,5) onmouseout=delete_color(this,5)>
                      					<TD id="level1" align=middle>{LISTNEWSCATEGORY.ID}</TD>
                     					<td id="level1" align="middle">
											<table width="80%" cellpadding="0" cellspacing="">
												<tr>
													<td width="50%">{LISTNEWSCATEGORY.UP}</td>
													<td width="50%">{LISTNEWSCATEGORY.DOWN}</td>
												</tr>
											</table>	
											 
										</td>
                     					<td id="level1" align="left">&nbsp;&nbsp;&nbsp;&nbsp;
										 	<IMG src="images/root.gif">&nbsp;{LISTNEWSCATEGORY.NAME}</td>
                      					<TD id="level1" align=middle>&nbsp;</TD>
                      					<TD id="level1" align=middle>
											<A title=Khóa href="?page=newscategory&do=list&action=status&id={LISTNEWSCATEGORY.ID}&status={LISTNEWSCATEGORY.STATUS}">
												<IMG class=icon src="{LISTNEWSCATEGORY.LOCK}"></A>&nbsp;
											<A title=Sửa href="?page=newscategory&do=edit&id={LISTNEWSCATEGORY.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTNEWSCATEGORY.USERNAME}\' ?')" href="?page=newscategory&do=list&action=delete&id={LISTNEWSCATEGORY.ID}">
												<IMG class=icon src="images/delete.gif"></A>										</TD>
									</TR>
									
										<!-- BEGIN: LISTCHILDNEWSCATEGORY -->
											<TR  onmouseover=change_color(this,5) onmouseout=delete_color(this,5)>
												<TD align=middle>{LISTCHILDNEWSCATEGORY.ID}</TD>
												<td align="middle">&nbsp;</td>
												<td align="center">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td width="10%" align="center">
																<table width="95%" cellpadding="0" cellspacing="">
																	<tr>
																		<td width="50%" align="center">{LISTCHILDNEWSCATEGORY.UP}</td>
																		<td width="50%" align="center">{LISTCHILDNEWSCATEGORY.DOWN}</td>
																	</tr>
																</table>	
															</td>
															<td width="90%">
																&nbsp;<IMG src="images/tree.gif">&nbsp;<IMG src="images/root.gif">&nbsp;{LISTCHILDNEWSCATEGORY.NAME}
															</td>
														</tr>
													</table>
												</td>
												<TD align=center>{LISTCHILDNEWSCATEGORY.TOTAL}</TD>
												<TD align=middle>
													<A title=Khóa href="?page=newscategory&do=list&action=status&id={LISTCHILDNEWSCATEGORY.ID}&status={LISTCHILDNEWSCATEGORY.STATUS}">
												<IMG class=icon src="{LISTCHILDNEWSCATEGORY.LOCK}"></A>&nbsp;
													<A title=Sửa href="?page=newscategory&do=edit&id={LISTCHILDNEWSCATEGORY.ID}">
														<IMG class=icon src="images/edit.gif"></A>&nbsp;
													<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTCHILDNEWSCATEGORY.USERNAME}\' ?')" href="?page=newscategory&do=list&action=delete&id={LISTCHILDNEWSCATEGORY.ID}">
														<IMG class=icon src="images/delete.gif"></A>										</TD>
											</TR>
										<!-- END: LISTCHILDNEWSCATEGORY -->
									
									<!-- END: LISTNEWSCATEGORY -->
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