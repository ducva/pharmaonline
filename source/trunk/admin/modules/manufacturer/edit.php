<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/manufacturer/edit.tpl');
	
	$manufacturer=new clsTable('manufacturer');
	$iManufacturerId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua hãng sản xuất
		$iId=$_GET['id'];
		$sName=$_POST['txtName'];
		
		$aManufacturer=$manufacturer->select("","","","Name ='$sName' and Id != '$iId'");
		if(count($aManufacturer) > 0)
		{
			$sMessage="<script>alert('Tên hãng sản xuất này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua hãng sản xuất
	
			$sAddress=$_POST['txtAddress'];
			$sTelephone=$_POST['txtTelephone'];
			$sMobile=$_POST['txtMobile'];
			$sEmail=$_POST['txtEmail'];
			$sFax=$_POST['txtFax'];
			$sInfo=$_POST['txtInfo'];
			$sWebsite=$_POST['txtWebsite'];
			//edit user
			$manufacturer->update("Name='$sName',Address='$sAddress',Telephone='$sTelephone',Mobile='$sMobile',Email='$sEmail',Fax='$sFax',Info='$sInfo',Website='$sWebsite'","Id=".$iId);
			//end edit user
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=manufacturer&do=edit&id=".$iId."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aManufacturer=$manufacturer->select('','','','Id='.$iManufacturerId);
	
	$edit->assign('NAME',$aManufacturer[0]['Name']);
	$edit->assign('ADDRESS',$aManufacturer[0]['Address']);
	$edit->assign('WEBSITE',$aManufacturer[0]['Website']);
	$edit->assign('INFO',$aManufacturer[0]['Info']);
	$edit->assign('EMAIL',$aManufacturer[0]['Email']);
	$edit->assign('TELEPHONE',$aManufacturer[0]['Telephone']);
	$edit->assign('MOBILE',$aManufacturer[0]['Mobile']);
	$edit->assign('FAX',$aManufacturer[0]['Fax']);
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>