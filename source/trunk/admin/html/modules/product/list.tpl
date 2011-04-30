<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
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
										<TH>Danh sách các sản phẩm trong hệ thống</TH>
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
										
										<FORM action="" name="frmSearchProduct" method="get" style="margin:0px;">
										<input type="hidden" name="page" value="product" />
										<input type="hidden" name="do" value="list" />
                        					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          					<TBODY>
                          					<TR>
                            					<TH>Tên :</TH>
                            					<TD><INPUT style="WIDTH: 200px" name=Key></TD>
												<TD>Thuộc danh mục</TD>
                            					<TD>
													<select id="catid" name="catid">
														<option value="0">Tất cả</option>
														<!-- BEGIN: CATEGORY -->
														<option id="level1" value="{CATEGORY.ID}">{CATEGORY.NAME}</option>
															<!-- BEGIN: CHILDCATEGORY -->
															<option value="{CHILDCATEGORY.ID}"> ---- {CHILDCATEGORY.NAME}</option>	
															<!-- END: CHILDCATEGORY -->
																
														<!-- END: CATEGORY -->
													</select>
												</TD>
											</TR>
                          					<TR>
                            					<TH></TH>
                            					<TD colspan="3"><INPUT class=button type=submit value="Tìm kiếm"> 
<INPUT class=button type=reset value="Nhập lại"> 
                            					</TD>
											</TR>
											</TBODY>
											</TABLE>
										</FORM>
										
										</TD>
                      					<TD vAlign=bottom align=right width="30%">
											<A title="Danh sách sản phẩm" href="?page=product&do=list">
												<IMG src="images/list.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Thêm mới" href="?page=product&do=add">
												<IMG src="images/add.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Cập nhập dữ liệu" onclick=window.location.reload(); href="#">
												<IMG class=icon src="images/refresh.gif"></A> 
                        					<A title="Giúp đỡ" href="#" target=_blank>
												<IMG class=icon src="images/help.gif"></A>                      					</TD>
									</TR>
									</TBODY>
									</TABLE>
									
									<FORM action="" name="frmListProduct" method="get" style="margin:0px;">
									<input type="hidden" name="page" value="product" />
									<input type="hidden" name="do" value="list" />
									<TABLE class=table cellSpacing=1 cellPadding=4>
									<TBODY>
									<TR>
										<TD width="15%">Thuộc danh mục</TD>
										<TD>
											<select id="catid" name="catid" onchange="this.form.submit();">
												<option value="0">Tất cả</option>
												<!-- BEGIN: CATEGORY -->
												<option id="level1" value="{CATEGORY.ID}" {CATEGORY.SELECTED}>{CATEGORY.NAME}</option>
													<!-- BEGIN: CHILDCATEGORY -->
													<option value="{CHILDCATEGORY.ID}" {CHILDCATEGORY.SELECTED}> ---- {CHILDCATEGORY.NAME}</option>	
													<!-- END: CHILDCATEGORY -->
														
												<!-- END: CATEGORY -->
											</select>
										</TD>
									</TR>
									</TBODY>
									</TABLE>
									</FORM>
                  					<TABLE class=table cellSpacing=1 cellPadding=4>
									<TBODY>
									<TR>
										  <TH width="5%">STT</TH>
										  <TH width="5%">Mã SP</TH>
										  <TH width="20%">Tên sản phẩm </TH>
										  <th width="10%">Ảnh</th>
										  <th width="15%">Danh mục </th>
										  <th width="10%">Ngày đăng </th>
										  <TH width="10%">Số lượt xem </TH>
										  <TH width="10%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTPRODUCT -->
									<TR  onmouseover=change_color(this,8) onmouseout=delete_color(this,8)>
                      					<TD align=middle>{LISTPRODUCT.ID}</TD>
										<TD align=middle>{LISTPRODUCT.CODE}</TD>
                     					<TD align=left style="padding-left:5px;">{LISTPRODUCT.NAME} 										</TD>
                      					<td align="middle"><img src="{LISTPRODUCT.IMAGE}" /></td>
                      					<td align="middle">{LISTPRODUCT.CATEGORY}</td>
										<td align="middle">{LISTPRODUCT.CREATEDATE}</td>
                      					<TD align="middle">{LISTPRODUCT.VIEW}</TD>
                      					<TD align="middle">
											<A title=Khóa href="?page=product&do=list&action=status&id={LISTPRODUCT.ID}&status={LISTPRODUCT.STATUS}">
												<IMG class=icon src="{LISTPRODUCT.LOCK}"></A>&nbsp;
											<A title=Sửa href="?page=product&do=edit&id={LISTPRODUCT.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này ?')" href="?page=product&do=list&action=delete&id={LISTPRODUCT.ID}">
												<IMG class=icon src="images/delete.gif"></A>										</TD>
									</TR>
									<!-- END: LISTPRODUCT -->
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
			
			</TD>
		</TR>
	</TBODY>
</TABLE>
<!-- END: MAIN -->