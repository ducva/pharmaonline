<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<script language="javascript">
	function ChangeKeyword()
	{
		window.location = '?page=adv&do=list&position='+frmListAdv.cboAdvPosition.value+'&keyword='+frmListAdv.txtKeyword.value;
	}
	function ChangePosition()
	{
		window.location = '?page=adv&do=list&position='+frmListAdv.cboAdvPosition.value;
	}
</script>
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM name="frmListAdv" action="" method="POST">
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
										<TH>Danh sách các quảng cáo trong hệ thống</TH>
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
	                            					
	                            					<TD><INPUT style="WIDTH: 200px" name="txtKeyword" value="{KEYWORD}"></TD>
	                            					
												</TR>
	                          					<TR>
	                            					<TH></TH>
	                            					<TD>
	                            					<INPUT class=button type="button" value="Tìm kiếm" onclick="ChangeKeyword();"> 
													<INPUT class=button type="button" value="Nhập lại" onclick="frmListAdv.txtKeyword.value = ''"> 
	                            					</TD>
												</TR>
												</TBODY>
												</TABLE>
											
										</TD>
                      					<TD vAlign=bottom align=right width="30%">
											<A title="Thêm mới" href="?page=adv&do=add&position={URLPOSITION}">
												<IMG src="images/add.gif" border="0" class=icon></A>&nbsp;&nbsp;&nbsp;
											<A title="Cập nhập dữ liệu" onclick=window.location.reload(); href="#">
												<IMG class=icon src="images/refresh.gif"></A> 
                        					<A title="Giúp đỡ" href="#" target=_blank>
												<IMG class=icon src="images/help.gif"></A>
										</TD>
									</TR>
									</TBODY>
									</TABLE>
									<div style="padding-top:5px; padding-bottom:5px;">
									<TABLE class=search>
										<TBODY>
											<TR>
												<TD width="80" style="font-size:14px; color:#FF6600; font-weight:bold; padding-left:20px;">Vị trí<TD>
												<TD>
													<select name="cboAdvPosition" onchange="ChangePosition();">
														<option value="">Tất cả</option>
														<option value="1" {SELECTED1}>Trái</option>
										  				<option value="2" {SELECTED2}>Phải</option>
										  				<option value="3" {SELECTED3}>Banner</option>
										  				<option value="4" {SELECTED4}>Giữa</option>
													</select>
												
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									</div>
									
                  					<TABLE class=table cellSpacing=1 cellPadding=4>
									<TBODY>
									<TR>
										  <TH width="5%">Mã</TH>
										  <TH width="">Tên quảng cáo </TH>
										  <TH width="10%">Vị trí </TH>
										  <TH width="10%">Thứ tự</TH>
										  <TH width="10%">Loại</TH>
										  <TH width="15%">Link</TH>
										  <TH width="10%">File</TH>
										  <TH width="15%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTADV -->
									<TR onmouseover=change_color(this,8) onmouseout=delete_color(this,8)>
                      					<TD align=center>{LISTADV.ID}</TD>
                     					<TD align=left>&nbsp;&nbsp;&nbsp;&nbsp;
										 	<IMG src="images/root.gif">&nbsp;{LISTADV.NAME}</TD>
                      					<TD align=center>{LISTADV.POSITION}</TD>
									 	<TD align=center>
                      						<A {LISTADV.HREFUP}>
												<IMG class=icon src="{LISTADV.UP}"></A>&nbsp;
											<A {LISTADV.HREFDOWN}>
												<IMG class=icon src="{LISTADV.DOWN}"></A>
                      					</TD>
                      					
                      					<TD align=center>{LISTADV.TYPE}</TD>
                      					<TD align=center>{LISTADV.LINK}</TD>
                      					<TD align=center>{LISTADV.FILE}</TD>
                      					<TD align=center>
											<A title={LISTADV.HIDE} href="?page=adv&do=list&position={LISTADV.URLPOSITION}&keyword={LISTADV.KEYWORD}&iPage={LISTADV.IPAGE}&action=active&id={LISTADV.ID}&status={LISTADV.STATUS}">
												<IMG class=icon src="{LISTADV.LOCK}">
											</A>
											<A title=Sửa href="?page=adv&do=edit&id={LISTADV.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTADV.NAME}\' ?')" href="?page=adv&do=list&position={LISTADV.URLPOSITION}&keyword={LISTADV.KEYWORD}&iPage={LISTADV.IPAGE}&action=delete&id={LISTADV.ID}">
												<IMG class=icon src="images/delete.gif"></A>
										</TD>
									</TR>
									<!-- END: LISTADV -->
									
									</TBODY>
									</TABLE>
									
                  					<BR>
                  					<TABLE class=page>
                  						<tr>
                  							
                  							<td>
                  								<table border="0" align="left" cellpadding="0" cellspacing="0">
                  									{PAGING}
                  								</table>
                  							</td>
                  						</tr>
										
									</TABLE>
								
								</TD>
							</TR>
							</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
				</form>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<!-- END: MAIN -->