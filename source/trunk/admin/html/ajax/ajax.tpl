<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN -->
<table class="table" style="WIDTH: 660px; BACKGROUND-COLOR: #ffffff" cellspacing="1" cellpadding="4">
<tbody>

	<!-- BEGIN: LISTPROPERTY -->
	<tr>
		
		<!-- BEGIN: PARENTPROPERTY -->
	  		<td id="level1" align="left" colspan="2"><strong>{PARENTPROPERTY.NAME}</strong>
			</td>
			<td id="level1" align="left" colspan="2"><strong>Đơn vị</strong>
			</td>
		<!-- END: PARENTPROPERTY -->  
		
		<!-- BEGIN: CHILDPROPERTY -->
			<td width="100" align="left" style="padding-left:30px;">
				  {CHILDPROPERTY.NAME}
			</td>
			<td width="100">
				<input type="text" name="txtProperty{CHILDPROPERTY.ID}" value="{CHILDPROPERTY.VALUE}" style="width:100px;">
			</td>
			<td width="162" align="left">{CHILDPROPERTY.UNIT}</td>
		<!-- END: CHILDPROPERTY -->
	</tr>
	<!-- END: LISTPROPERTY -->
 </tbody>
</table>
<!-- END: MAIN -->