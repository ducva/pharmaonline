<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/admin/edit.tpl');
	
	$admin=new clsTable('member');
	$iAdminId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$iId=$_GET['id'];
		$sUsername=$_POST['txtUsername'];
		
		$aAdmin=$admin->select("","","","Username ='$sUsername' and Id != '$iId'");
		if(count($aAdmin) > 0)
		{
			$sMessage="<script>alert('Tên đăng nhập này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua user
			if($_POST['txtPassword'] != '' && $_POST['txtConfirmPassword'] !='')
			{
				$sPassword=",Password='".md5($_POST['txtPassword'])."'";
			}
			else
				$sPassword='';
				
			//edit user
			$admin->update("Username='$sUsername'".$sPassword,"Id=".$iId);
			//end edit user
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=admin&do=edit&id=".$iId."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aAdmin=$admin->select('','','','Id='.$iAdminId);
	
	$edit->assign('USERNAME',$aAdmin[0]['Username']);
		
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>