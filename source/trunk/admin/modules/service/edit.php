<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/service/edit.tpl');
	include("FCKeditor/fckeditor.php");
	
	$service=new clsTable('intro');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$sDetail=$_POST['txtDetail'];
		$iId=$_POST['hdnId'];
		//edit intro
		$service->update("Detail='$sDetail'","Id=".$iId);
		//end edit intro
		$sMessage="<script>alert('Cập nhật thành công!');window.location='?page=service&do=edit';</script>";
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aService=$service->select("","","","PageName='service'");
	$edit->assign('ID',$aService[0]['Id']);
	//Detail
	$oFCKeditor = new FCKeditor('txtDetail') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Width		= 800;
	$oFCKeditor->Height		= 400;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= $aService[0]['Detail'];
	$sDetail = $oFCKeditor->CreateHtml() ;
	$edit->assign('DETAIL',$sDetail);
	//end Detail
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>