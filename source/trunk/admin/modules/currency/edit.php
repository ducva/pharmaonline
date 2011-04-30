<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/currency/edit.tpl');
	
	$currency=new clsTable('currency');
	$iCurrencyId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai
		$iId=$_GET['id'];
		$sName=$_POST['txtName'];
		
		$aCurrency=$currency->select("","","","Name ='$sName' and Id != '$iUnitId'");
		if(count($aCurrency) > 0)
		{
			$sMessage="<script>alert('Tên đơn vị tiền tệ này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai
			$sRate=$_POST['txtRate'];
			$sInfo=$_POST['txtInfo'];
			//edit 
			$currency->update("Name='$sName',Rate='$sRate',Info='$sInfo'","Id=".$iId);
			//end edit
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=currency&do=edit&id=".$iId."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aCurrency=$currency->select('','','','Id='.$iCurrencyId);
	
	$edit->assign('NAME',$aCurrency[0]['Name']);
	$edit->assign('INFO',$aCurrency[0]['Info']);
	$edit->assign('RATE',$aCurrency[0]['Rate']);
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>