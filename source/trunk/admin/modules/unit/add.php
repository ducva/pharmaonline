<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/unit/add.tpl');
	
	$unit=new clsTable('unit');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua aUnit
		$sName=$_POST['txtName'];
		$aUnit=$unit->select("","","","Name ='$sName'");
		if(count($aUnit) > 0)
		{
			$sMessage="<script>alert('Đơn vị tính này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua aUnit
			//get max position
			$aUnit=$unit->select();
			$iLine=count($aUnit);
			$iMaxPosition=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				if($iMaxPosition < $aUnit[$i]['Position'] )
					$iMaxPosition=$aUnit[$i]['Position'];
			}
			$iMaxPosition++;
			//end get max position
			
			$sInfo=$_POST['txtInfo'];
			//them aUnit
			$unit->insert("Name,Info,Position","'$sName','$sInfo','$iMaxPosition'");
			//end them aUnit
			
			$sMessage="<script>alert('Bạn đã thêm thành công đơn vị tính mới vào hệ thống');window.location='?page=unit&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>