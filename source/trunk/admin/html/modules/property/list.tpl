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
								<TD width="95%"><SPAN class=title>Quản trị  thuộc tính QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách các thuộc tính trong hệ thống</TH>
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
											<A title="Danh sách thuộc tính" href="?page=property&do=list">
												<IMG src="images/list.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Thêm mới" href="?page=property&do=add">
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
										  <th width="7%">Vị trí </th>
										  <th width="30%">Tên thuộc tính </th>
										  <TH width="20%">Chi tiết </TH>
										  <TH width="10%">Đơn vị </TH>
										  <TH width="15%">Các giá trị </TH>
										  <TH width="10%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTPROPERTY -->
									<TR id="level1">
                      					<TD id="level1" align=middle>{LISTPROPERTY.ID}</TD>
                     					<td id="level1" align="middle">
											<table id="level1" width="80%" cellpadding="0" cellspacing="0">
												<tr>
													<td id="level1" width="50%">{LISTPROPERTY.UP}</td>
													<td id="level1" width="50%">{LISTPROPERTY.DOWN}</td>
												</tr>
											</table>	
											 
										</td>
                     					<td id="level1" align="left">&nbsp;&nbsp;&nbsp;&nbsp;
										 	<IMG src="images/root.gif">&nbsp;<strong>{LISTPROPERTY.NAME}</strong></td>
                      					<TD id="level1" align=center>{LISTPROPERTY.DETAIL}</TD>
										<TD id="level1" align=center>{LISTPROPERTY.UNIT}</TD>
										<TD id="level1" align=center>{LISTPROPERTY.VALUE}</TD>
                      					<TD id="level1" align=middle>
											<A title=Khóa href="?page=property&do=list&action=status&id={LISTPROPERTY.ID}&status={LISTPROPERTY.STATUS}">
												<IMG class=icon src="{LISTPROPERTY.LOCK}"></A>&nbsp;
											<A title=Sửa href="?page=property&do=edit&id={LISTPROPERTY.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTPROPERTY.USERNAME}\' ?')" href="?page=property&do=list&action=delete&id={LISTPROPERTY.ID}">
												<IMG class=icon src="images/delete.gif"></A>										</TD>
									</TR>
									
										<!-- BEGIN: LISTCHILDPROPERTY -->
											<TR  onmouseover=change_color(this,7) onmouseout=delete_color(this,7)>
												<TD align=middle>{LISTCHILDPROPERTY.ID}</TD>
												<td align="middle">&nbsp;</td>
												<td align="center">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td width="20%" align="center">
																<table width="100%" cellpadding="0" cellspacing="">
																	<tr>
																		<td width="50%" align="center">{LISTCHILDPROPERTY.UP}</td>
																		<td width="50%" align="center">{LISTCHILDPROPERTY.DOWN}</td>
																	</tr>
																</table>	
															</td>
															<td width="80%">
																&nbsp;<IMG src="images/tree.gif">&nbsp;<IMG src="images/root.gif">&nbsp;{LISTCHILDPROPERTY.NAME}
															</td>
														</tr>
													</table>
												</td>
												<TD align=center>{LISTCHILDPROPERTY.DETAIL}</TD>
												<TD align=center>{LISTCHILDPROPERTY.UNIT}</TD>
												<TD align=center>{LISTCHILDPROPERTY.VALUE}</TD>
												<TD align=middle>
													<A title=Khóa href="?page=property&do=list&action=status&id={LISTCHILDPROPERTY.ID}&status={LISTCHILDPROPERTY.STATUS}">
												<IMG class=icon src="{LISTCHILDPROPERTY.LOCK}"></A>&nbsp;
													<A title=Sửa href="?page=property&do=edit&id={LISTCHILDPROPERTY.ID}">
														<IMG class=icon src="images/edit.gif"></A>&nbsp;
													<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTCHILDPROPERTY.USERNAME}\' ?')" href="?page=property&do=list&action=delete&id={LISTCHILDPROPERTY.ID}">
														<IMG class=icon src="images/delete.gif"></A>										</TD>
											</TR>
										<!-- END: LISTCHILDPROPERTY -->
									
									<!-- END: LISTPROPERTY -->
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