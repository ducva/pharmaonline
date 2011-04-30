<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/admin/add.tpl');
	
	$admin=new clsTable('admin');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$sUsername=$_POST['txtUsername'];
		$sPassword=md5($_POST['txtPassword']);
		$aAdmin=$admin->select("","","","Username ='$sUsername'");
		if(count($aMember) > 0)
		{
			$sMessage="<script>alert('Tên user này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua user

			//them user
			$admin->insert("Username,Password","'$sUsername','$sPassword'");
			//end them user
			
			$sMessage="<script>alert('Bạn đã thêm thành công quản trị viên mới vào hệ thống');window.location='?page=admin&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>