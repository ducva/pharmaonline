<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/currency/add.tpl');
	
	$currency=new clsTable('currency');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua aUnit
		$sName=$_POST['txtName'];
		$aCurrency=$currency->select("","","","Name ='$sName'");
		if(count($aCurrency) > 0)
		{
			$sMessage="<script>alert('Đơn vị tiền tệ này đã được đăng ký! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua aUnit
			//get max position
			$aCurrency=$currency->select();
			$iLine=count($aCurrency);
			$iMaxPosition=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				if($iMaxPosition < $aCurrency[$i]['Position'] )
					$iMaxPosition=$aCurrency[$i]['Position'];
			}
			$iMaxPosition++;
			//end get max position
			
			$sInfo=$_POST['txtInfo'];
			$sRate=$_POST['txtRate'];
			//them aUnit
			$currency->insert("Name,Info,Position,Rate","'$sName','$sInfo','$iMaxPosition','$sRate'");
			//end them aUnit
			
			$sMessage="<script>alert('Bạn đã thêm thành công đơn vị tiền tệ mới vào hệ thống');window.location='?page=currency&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>