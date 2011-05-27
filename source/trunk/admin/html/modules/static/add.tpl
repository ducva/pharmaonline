<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
{MESSAGE}
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" method="post" enctype="multipart/form-data">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị tin tứcQTM-GROUP </SPAN></TD>
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
										<TH>Thêm mới  tin tức vào hệ thống</TH>
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
									  	<A title="Danh sách" href="?page=news&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
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
								  		<TH>Tiêu đề:<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="txtTitle" id="txtTitle" style="WIDTH: 660px"></TD>
									</TR>
									<TR>
								  		<TH>Thuộc danh mục tin:<SPAN class=note>&nbsp;&nbsp;</SPAN></TH>
								  		<TD>
											<select name="cboNewsCategoryId">
												<!-- BEGIN: NEWSCATEGORY -->
												<option id="level1" value="{NEWSCATEGORY.ID}">{NEWSCATEGORY.NAME}</option>
													<!-- BEGIN: CHILDNEWSCATEGORY -->
													<option value="{CHILDNEWSCATEGORY.ID}"> ---- {CHILDNEWSCATEGORY.NAME}</option>	
													<!-- END: CHILDNEWSCATEGORY -->
														
												<!-- END: NEWSCATEGORY -->
											</select>
										</TD>
									</TR>
									<TR>
								  		<TH>Ảnh minh họa:</TH>
								  		<TD>
								  		  <input name="txtImage" type="file" id="txtImage" style="width:300px;" />
								  		</TD>
									</TR>
									<TR>
								  		<TH>Chú thích ảnh:<SPAN class=note>*</SPAN></TH>
								  		<TD><input name="txtImageNote" id="txtImageNote" style="WIDTH: 660px" /></TD>
									</TR>
									<TR>
								  		<TH valign="top">Mô tả ngắn:<SPAN class=note>*</SPAN></TH>
								  		<TD>{DESCRIPTION}</TD>
									</TR>
									<TR>
								  		<TH valign="top">Chi tiết  :<SPAN class=note>*</SPAN></TH>
								  		<TD>{DETAIL}</TD>
									</TR>
									<TR>
								  		<TH>Tin nổi bật  :<SPAN class=note>*</SPAN></TH>
								  		<TD><INPUT name="chkHotNews" type="checkbox" value="1"></TD>
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