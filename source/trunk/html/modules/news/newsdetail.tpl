<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BEGIN: MAIN --><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;font-family:Arial,Helvetica,sans-serif; font-size:10pt;color:#666666;" bordercolor="#111111" width="100%" id="AutoNumber16">
  <tr>
    <td width="100%" height="25" colspan="2" align="left" valign="middle" class="lnkdirect1">
		{TOOLBAR}	</td>
  </tr>
  <tr>
    <td width="100%" align="center" valign="top" colspan="2"><p align="left" style="margin-top: 5; margin-bottom: 5"><font color="#FE8E3C"><b>{NAME}</b></font></td>
  </tr>
  <tr>
    <td width="38%" align="center" valign="top" style="padding-left:3px;"><img border="0" src="images/upload/news/{IMAGE}" width="200"><br />
    <em>{IMAGENOTE}</em></td>
    <td width="62%" align="left" valign="top">
		<font color="#000000" size="4">{TITLE}</font>({WRITEDATE})
		<br />
   	    <em>{DESCRIPTION}    </em></td>
  </tr>
  <tr>
    <td width="100%" align="left" valign="top" colspan="2" style="padding-top:10px;padding-left:5px;padding-rigth:5px; padding-bottom:5px;">
      {DETAIL}</td>
  </tr>
  <tr>
    <td width="38%" align="center" valign="top" bgcolor="#E8F0E1"><p align="left"> <img border="0" src="images/icon_back.gif" width="51" height="16" onclick="javascript:history.go(-1);" style="cursor:hand"></td>
    <td width="62%" align="center" valign="top" bgcolor="#E8F0E1"><p align="right"> <a href="#"><img border="0" src="images/icon_top.gif" width="48" height="16"></a></td>
  </tr>
  <tr>
    <td colspan="2" height="25" align="left" valign="middle" style="padding-left:5px;">
		Các tin khác:
    </td>
  </tr>
  
<!-- BEGIN: OTHERNEWS --> 
  <tr>
    <td colspan="2" align="left" style="padding-left:20px; padding-top:3px; padding-bottom:3px;" valign="middle">
		<img src="images/reinitialiser.jpg" width="18" height="18" border="0" align="absmiddle"> 
		<a href="index.php?page=newsdetail&newsid={OTHERNEWS.ID}" class="hotNews">({OTHERNEWS.WRITEDATE}){OTHERNEWS.TITLE}</a>
    </td>
  </tr>
<!-- END: OTHERNEWS -->

</table>
<!-- END: MAIN -->