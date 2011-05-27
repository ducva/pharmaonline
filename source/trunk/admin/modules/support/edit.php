<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/support/edit.tpl');
	
	$admin=new clsTable('supporter');
	$iAdminId=$_GET['id'];
	$edit->assign('MESSAGE','');
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$iId=$_GET['id'];
		$sUsername=$_POST['txtName'];
		$title=$_POST['txtTitle'];
		$skype=$_POST['txtSkype'];
		$yahoo=$_POST['txtYahoo'];
		$mobile=$_POST['txtMobile'];
		$status=$_POST['chkStatus'];
		
		$aAdmin=$admin->select("","","","name ='$sUsername' and Id != '$iId'");
		if(count($aAdmin) > 0)
		{
			$sMessage="<script>alert('Tên đăng nhập này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
			//edit user
			$admin->update("name='$sUsername', title='$title', skype='$skype', yahoo='$yahoo', mobile='$mobile', status='$status'","Id=".$iId);
			//end edit user
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=support&do=edit&id=".$iId."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aAdmin=$admin->select("name,title,skype, mobile, yahoo, status",'','','Id='.$iAdminId);
	
	$edit->assign('NAME',$aAdmin[0]['name']);
	$edit->assign('TITLE',$aAdmin[0]['title']);
	$edit->assign('SKYPE',$aAdmin[0]['skype']);
	$edit->assign('YAHOO',$aAdmin[0]['yahoo']);
	$edit->assign('MOBILE',$aAdmin[0]['mobile']);
	$edit->assign('STATUS',($aAdmin[0]['status'])?('checked=\"checked\"'):(''));
	
	
		
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>