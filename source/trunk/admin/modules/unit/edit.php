<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/unit/edit.tpl');
	
	$unit=new clsTable('unit');
	$iUnitId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua hãng sản xuất
		$iId=$_GET['id'];
		$sName=$_POST['txtName'];
		
		$aUnit=$unit->select("","","","Name ='$sName' and Id != '$iUnitId'");
		if(count($aUnit) > 0)
		{
			$sMessage="<script>alert('Tên đơn vị tính này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua hãng sản xuất
	
			$sInfo=$_POST['txtInfo'];
			//edit 
			$unit->update("Name='$sName',Info='$sInfo'","Id=".$iUnitId);
			//end edit
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=unit&do=edit&id=".$iUnitId."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aUnit=$unit->select('','','','Id='.$iUnitId);
	
	$edit->assign('NAME',$aUnit[0]['Name']);
	$edit->assign('INFO',$aUnit[0]['Info']);
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>