<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<script language="javascript">
	function Search(obj)
	{
		window.location='?page=member&do=list&keyword='+obj.txtKeyword.value;
	}
</script>
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" name="frmMember" method="">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị thành viên QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách các thành viên trong hệ thống</TH>
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
                            					<TD><INPUT class=button type="button" value="Tìm kiếm" onclick="Search(this.form);"> 
<INPUT class=button type=reset value="Nhập lại"> 
                            					</TD>
											</TR>
											</TBODY>
											</TABLE>
										</TD>
                      					<TD vAlign=bottom align=right width="30%">
											<A title="Thêm mới" href="?page=member&do=add">
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
										  <TH width="20%">Họ và tên </TH>
										  <th width="15%">Tên truy cập </th>
										  <th width="10%">Email</th>
										  <th width="15%">Ngày tham gia </th>
										  <TH width="10%">Điểm</TH>
										  <TH width="10%">Tổng điểm</TH>
										  <TH width="10%">%</TH>
										  <TH width="10%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTMEMBER -->
									<TR style="cursor:hand;" onmouseover=change_color(this,9) onmouseout=delete_color(this,9)>
                      					<TD align=center onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.ID}</TD>
                     					<TD align=left onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">&nbsp;&nbsp;&nbsp;&nbsp;
										 	<IMG src="images/root.gif">&nbsp;{LISTMEMBER.FULLNAME} 										</TD>
                      					<td align="center" onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.USERNAME}</td>
                      					<td align="center" onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.EMAIL}</td>
                      					<td align="center" onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.JOINDATE}</td>
                      					<TD align=center onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.POINT}</TD>
                      					<TD align=center onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.TOTALPOINT}</TD>
                      					<TD align=center onclick="window.location='?page=member&do=detail&id={LISTMEMBER.ID}'">{LISTMEMBER.PERCENT}</TD>
                      					<TD align=center>
											<A title=Sửa href="?page=member&do=edit&id={LISTMEMBER.ID}">
												<IMG class=icon src="images/edit.gif"></A>&nbsp;
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa \'{LISTMEMBER.FULLNAME}\' ?')" href="?page=member&do=list&action=delete&id={LISTMEMBER.ID}">
												<IMG class=icon src="images/delete.gif"></A>										</TD>
									</TR>
									<!-- END: LISTMEMBER -->
									</TBODY>
									</TABLE>
                  					<BR>
                  					<TABLE class=page>
									<TBODY>
									<TR>
                      					<TD>
                      						<table border="0" align="left" cellpadding="0" cellspacing="0">
												{PAGING}
											</table>
											
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