<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/config/edit.tpl');
	$oMethod = new clsMethod();
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$aMethod = array();
		while(list($key, $value) = each($oMethod->aVar))
		{
			if($key != 'Id')
				$aMethod[$key] = $_POST['txt'.$key];
		}
		$oMethod->Update($aMethod);
		echo "<script>alert('Bạn đã sửa thành công cấu hình hệ thống!');window.location='?page=config&do=edit';</script>";
	}
	$edit->assign('MAIN', $oMethod->aVar);
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>