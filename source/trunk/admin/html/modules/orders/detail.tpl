<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->

<TABLE class=center cellSpacing=0 cellPadding=0>
	<TBODY>
  		<TR>
    		<TD vAlign=top>
      		<FORM action="print.php?id={MAIN.OrderId}" method="post">
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
										<TH>Chi tiết hóa đơn</TH>
									</TR>
									</TBODY>
									</TABLE>
                  				</TD>	
							</TR>
              				<TR>
                				<TD>
                  					<TABLE class=search width="100%">
									<TBODY>
									<TR>
									<TD align=right width="5%"><IMG class=icon src="images/search.gif"> 
                      				</TD>
									<TD align=middle width="65%">
                    					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                      					<TBODY>
                      					<TR>
                      						<TH align="left">Mã người mua:</TH>
                        					<TD>
                        					{MAIN.Id}
                                        	</TD>
                        					<TH align="left">Tên người mua:</TH>
                        					<TD>
                        					{MAIN.Fullname}
                                        	</TD>
                                        	<TH align="left">Điện thoại:</TH>
                                        	<TD>
                        					{MAIN.Telephone}
                                        	</TD>
                                        	
										</TR>
                      					<tr>
                      						<TH align="left">Ngày mua:</TH>
                                        	<TD>
                        					{MAIN.CreateDate}
                                        	</TD>
                                        	<TH align="left">Tổng tiền:</TH>
                                        	<TD>
                        					{MAIN.Money}
                                        	</TD>
                                        	
                      					</tr>
                      					<tr>
                      						<TH align="left">Địa điểm giao hàng:</TH>
                                        	<TD colspan="3">
                        					{MAIN.Address}
                                        	</TD>
                      					</tr>
										</TBODY>
										</TABLE>
									</TD>
									  <TD vAlign=bottom align=right width="100%">
									  	<A title="Danh sách" href="?page=orders&do=list"><IMG class=icon src="images/list.gif"></A>&nbsp;&nbsp;&nbsp; 
										<A title="Cập nhập dữ liệu" onclick=window.location.reload(); 
href="#"><IMG class=icon src="images/refresh.gif"></A> 
										<A title="Giúp đỡ" href="#" target=_blank><IMG class=icon src="images/help.gif"></A>                      
										</TD>
									</TR>
									</TBODY>
									</TABLE>
                  					<TABLE class=table cellSpacing=1 cellPadding=4>
									<TBODY>
									<TR>
										  <TH width="10%">Mã hàng</TH>
										  <TH width="30%">Tên hàng</TH>
										  <th width="20%">Giá tiền</th>
										  <th width="20%">Số lượng</th>
										  <th width="20%">Tiền</th>
									</TR>
                    				
									<!-- BEGIN: LISTDETAIL -->
									<TR onmouseover="change_color(this,5)" onmouseout=delete_color(this,5)>
                      					<TD align=center>{LISTDETAIL.Code}</TD>
                     					<TD align=left>{LISTDETAIL.Name}</TD>
                 						<TD align=center>{LISTDETAIL.PriceQTM}</TD>
             							<TD align=center>{LISTDETAIL.Quantity}</TD>	
             							<TD align=center>{LISTDETAIL.Money}</TD>	
									</TR>
									<!-- END: LISTDETAIL -->
									</TBODY>
									</TABLE>
                  					<BR>
                  					<TABLE class=page>
									<TBODY>
									<TR>
                      					<TD style="padding-right:20px;">
                      						<table border="0" align="right" cellpadding="0" cellspacing="0">
                      							<INPUT  type=submit value="Print" name="btnSubmit">
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