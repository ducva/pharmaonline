<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/manufacturer/add.tpl');
	
	$manufacturer=new clsTable('manufacturer');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua manufacturer
		$sName=$_POST['txtName'];
		$aManufacturer=$manufacturer->select("","","","Name ='$sName'");
		if(count($aManufacturer) > 0)
		{
			$sMessage="<script>alert('Nhà sản xuất này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua manufacturer
			//get max position
			$aManufacturer=$manufacturer->select();
			$iLine=count($aManufacturer);
			$iMaxPosition=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				if($iMaxPosition < $aManufacturer[$i]['Position'] )
					$iMaxPosition=$aManufacturer[$i]['Position'];
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
			//them manufacturer
			$manufacturer->insert("Name,Address,Telephone,Mobile,Fax,Email,Website,Info,Position","'$sName','$sAddress','$sTelephone','$sMobile','$sFax','$sEmail','$sWebsite','$sInfo','$iMaxPosition'");
			//end them manufacturer
			
			$sMessage="<script>alert('Bạn đã thêm thành công nhà sản xuất mới vào hệ thống');window.location='?page=manufacturer&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>