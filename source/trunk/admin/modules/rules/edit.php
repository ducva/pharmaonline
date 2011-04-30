<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/rules/edit.tpl');
	include("FCKeditor/fckeditor.php");
	
	$rules=new clsTable('rules');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{	
		$sName=$_POST['txtName'];
		$sDetail=$_POST['txtDetail'];
		
		//add rules
		$rules->update("Name='$sName',Detail='$sDetail'","Id=".$_GET['id']);
		//end add rules
		$sMessage="<script>alert('Cập nhật thành công');window.location='?page=rules&do=edit&id=".$_GET['id']."';</script>";
		
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aRules=$rules->select('','','','Id='.$_GET['id']);
	
	//Detail
	$oFCKeditor = new FCKeditor('txtDetail') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Height		= 400;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= $aRules[0]['Detail'];
	$sDetail = $oFCKeditor->CreateHtml() ;
	//end Detail
	$edit->assign('DETAIL',$sDetail);
	$edit->assign('NAME',$aRules[0]['Name']);
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>