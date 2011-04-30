<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/provider/add.tpl');
	
	$provider=new clsTable('provider');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua provider
		$sName=$_POST['txtName'];
		$aProvider=$provider->select("","","","Name ='$sName'");
		if(count($aProvider) > 0)
		{
			$sMessage="<script>alert('Nhà cung cấp này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua provider
			//get max position
			$aProvider=$provider->select();
			$iLine=count($aProvider);
			$iMaxPosition=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				if($iMaxPosition < $aProvider[$i]['Position'] )
					$iMaxPosition=$aProvider[$i]['Position'];
			}
			$iMaxPosition++;
			//end get max position
			
			$sAddress=$_POST['txtAddress'];
			$sFax=$_POST['txtFax'];
			$sTelephone=$_POST['txtTelephone'];
			$sMobile=$_POST['txtMobile'];
			$sEmail=$_POST['txtEmail'];
			$sWebsite=$_POST['txtWebsite'];
			$sInfo=$_POST['txtInfo'];
			//them user
			$provider->insert("Name,Address,Telephone,Mobile,Fax,Email,Website,Info,Position","'$sName','$sAddress','$sTelephone','$sMobile','$sFax','$sEmail','$sWebsite','$sInfo','$iMaxPosition'");
			//end them user
			
			$sMessage="<script>alert('Bạn đã thêm thành công nhà phân phối mới vào hệ thống');window.location='?page=provider&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>