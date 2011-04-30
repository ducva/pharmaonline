<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/provider/edit.tpl');
	
	$provider=new clsTable('provider');
	$iProviderId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua hãng sản xuất
		$iId=$_GET['id'];
		$sName=$_POST['txtName'];
		
		$aProvider=$provider->select("","","","Name ='$sName' and Id != '$iId'");
		if(count($aProvider) > 0)
		{
			$sMessage="<script>alert('Tên nhà cung cấp này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
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
			$provider->update("Name='$sName',Address='$sAddress',Telephone='$sTelephone',Mobile='$sMobile',Email='$sEmail',Fax='$sFax',Info='$sInfo',Website='$sWebsite'","Id=".$iId);
			//end edit user
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=provider&do=edit&id=".$iId."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aProvider=$provider->select('','','','Id='.$iProviderId);
	
	$edit->assign('NAME',$aProvider[0]['Name']);
	$edit->assign('ADDRESS',$aProvider[0]['Address']);
	$edit->assign('WEBSITE',$aProvider[0]['Website']);
	$edit->assign('INFO',$aProvider[0]['Info']);
	$edit->assign('EMAIL',$aProvider[0]['Email']);
	$edit->assign('TELEPHONE',$aProvider[0]['Telephone']);
	$edit->assign('MOBILE',$aProvider[0]['Mobile']);
	$edit->assign('FAX',$aProvider[0]['Fax']);
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>