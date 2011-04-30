<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<script language="javascript">
	function SearchDay(obj)
	{
		if(obj.cboMonth.value != '')
		{
			if(obj.cboDay.value != '')
			{
				var day = obj.cboDay.value;
				if(obj.cboDay.value < 10)
					day = '0'+obj.cboDay.value;
				var month = obj.cboMonth.value;
				if(obj.cboMonth.value < 10)
					month = '0'+obj.cboMonth.value;
				window.location='?page=orders&do=list&keyword='+obj.cboYear.value+'-'+month+'-'+day;
			}
			else
			{
				var month = obj.cboMonth.value;
				if(obj.cboMonth.value < 10)
					month = '0'+obj.cboMonth.value;
				window.location='?page=orders&do=list&keyword='+obj.cboYear.value+'-'+month;
			}
		}
		else
			window.location='?page=orders&do=list&keyword='+obj.cboYear.value;
	}
	function SearchMonth(obj)
	{
		if(obj.cboMonth.value != '')
		{
			var month = obj.cboMonth.value;
			if(obj.cboMonth.value < 10)
				month = '0'+obj.cboMonth.value;
			window.location='?page=orders&do=list&keyword='+obj.cboYear.value+'-'+month;
		}
		else
			window.location='?page=orders&do=list&keyword='+obj.cboYear.value;
	}
	function SearchYear(obj)
	{
		window.location='?page=orders&do=list&keyword='+obj.cboYear.value;
	}
</script>
<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="" name="frmOrders" method="">
      		<TABLE class=main cellSpacing=0 cellPadding=0>
        		<TBODY>
        			<TR>
          				<TD>
            				<TABLE class=title cellSpacing=3 cellPadding=3>
              				<TBODY>
							<TR>
								<TD width="5%"><IMG class=icon id=icon src="images/laguage.gif" align=bottom border=0></TD>
								<TD width="95%"><SPAN class=title>Quản trị hóa đơn QTM-GROUP </SPAN></TD>
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
										<TH>Danh sách các hóa đơn trong hệ thống</TH>
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
                            					<TH>Tìm kiếm theo ngày thanh toán :</TH>
                            					<TD>Ngày
										  			<select name="cboDay" onchange="SearchDay(this.form);">
										  			<option value="">Tất cả</option>
													<!-- BEGIN: DAY -->
										  				<option value="{DAY.VALUE}" {DAY.DAY}>{DAY.NAME}</option>
													<!-- END: DAY -->
										  			</select> 
										  			tháng 
										  		    <select name="cboMonth" onchange="SearchMonth(this.form);">
										  		    <option value="">Tất cả</option>
		                                              <!-- BEGIN: MONTH -->
		                                              <option value="{MONTH.VALUE}" {MONTH.MONTH}>{MONTH.NAME}</option>
		                                              <!-- END: MONTH -->
		                                            </select> 
										  		    năm 
										  		    <select name="cboYear" onchange="SearchYear(this.form);">
										  		      <!-- BEGIN: YEAR -->
		                                              <option value="{YEAR.VALUE}" {YEAR.YEAR}>{YEAR.NAME}</option>
		                                              <!-- END: YEAR -->
		                                            </select>
                                            	</TD>
											</TR>
                          					
											</TBODY>
											</TABLE>
										</TD>
                      					<TD vAlign=bottom align=right width="30%">
											<A title="Thêm mới" href="?page=orders&do=add">
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
										  <TH width="20%">Tên người mua</TH>
										  <th width="15%">Ngày mua</th>
										  <th width="15%">Ngày thanh toán</th>
										  <th width="20%">Tổng tiền </th>
										  <TH width="10%">Tình trạng</TH>
										  <TH width="10%">Quản trị</TH>
									</TR>
                    				
									<!-- BEGIN: LISTORDERS -->
									<TR style="cursor:hand;"  onmouseover="change_color(this,7)" onmouseout=delete_color(this,7)>
                      					<TD align=center onclick="window.location='?page=orders&do=detail&id={LISTORDERS.Id}'">{LISTORDERS.Id}</TD>
                     					<TD align=center onclick="window.location='?page=orders&do=detail&id={LISTORDERS.Id}'">{LISTORDERS.memberName}</TD>
                     					<TD align=center onclick="window.location='?page=orders&do=detail&id={LISTORDERS.Id}'">{LISTORDERS.CreateDate}</TD>
                     					<TD align=center onclick="window.location='?page=orders&do=detail&id={LISTORDERS.Id}'">{LISTORDERS.PayDate}</TD>
                     					<TD align=center onclick="window.location='?page=orders&do=detail&id={LISTORDERS.Id}'">{LISTORDERS.Money}</TD>
                     					<TD align=center onclick="window.location='?page=orders&do=detail&id={LISTORDERS.Id}'">{LISTORDERS.SubStatus}</TD>
                      					<TD align=center>
                      						<A onclick="return confirm('Bạn có chắc chắn muốn thay đổi tình trạng?')"   href="?page=orders&do=list&keyword={LISTORDERS.KEYWORD}&iPage={LISTORDERS.IPAGE}&action=active&id={LISTORDERS.Id}&status={LISTORDERS.Status}">
												<IMG class=icon src="{LISTORDERS.LOCK}">
											</A>
											<A title=Xóa onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="?page=orders&do=list&action=delete&id={LISTORDERS.Id}">
											<IMG class=icon src="images/delete.gif"></A>																				</TD>
									</TR>
									<!-- END: LISTORDERS -->
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