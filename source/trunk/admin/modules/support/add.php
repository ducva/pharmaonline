<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/support/add.tpl');
	
	$admin=new clsTable('supporter');
	$add->assign('MESSAGE','');
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$sUsername=$_POST['txtName'];
		$title=$_POST['txtTitle'];
		$skype=$_POST['txtSkype'];
		$yahoo=$_POST['txtYahoo'];
		$mobile=$_POST['txtMobile'];
		$status=$_POST['chkStatus'];
		
		$aAdmin=$admin->select("","","","name ='$sUsername'");
		if(count($aMember) > 0)
		{
			$sMessage="<script>alert('Tên user này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua user

			//them user
			$admin->insert("name,title,skype, mobile, yahoo, status","'$sUsername','$title', '$skype', '$yahoo', '$mobile', '$status' ");
			//end them user
			
			$sMessage="<script>alert('Bạn đã thêm thành công quản trị viên mới vào hệ thống');window.location='?page=support&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>