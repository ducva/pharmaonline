<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/rules/add.tpl');
	include("FCKeditor/fckeditor.php");
	
	$rules=new clsTable('rules');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{	
		//get max position
		$aRules=$rules->select();
		$iLine=count($aRules);
		$iMaxPosition=0;
		for($i=0 ; $i < $iLine ; $i++)
		{
			if($iMaxPosition < $aRules[$i]['Position'] )
				$iMaxPosition=$aRules[$i]['Position'];
		}
		$iMaxPosition++;
		
		$sName=$_POST['txtName'];
		$sDetail=$_POST['txtDetail'];
		
		//add rules
		$rules->insert("Name,Detail,WriteDate,Position","'$sName','$sDetail',now(),'$iMaxPosition'");
		//end add rules
		$sMessage="<script>alert('Bạn đã thêm thành công qui định mới vào hệ thống');window.location='?page=rules&do=add';</script>";
		
		$add->assign('MESSAGE',$sMessage);
	}
	
	//Detail
	$oFCKeditor = new FCKeditor('txtDetail') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Height		= 400;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= '';
	$sDetail = $oFCKeditor->CreateHtml() ;
	//end Detail
	$add->assign('DETAIL',$sDetail);
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>