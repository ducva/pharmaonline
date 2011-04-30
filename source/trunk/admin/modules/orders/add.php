<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/orders/add.tpl');
	
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$member=new clsTable('member');
		$aTestId = $member->select('', '', '', 'Id = '.$_POST['txtmemberId']);
		if(count($aTestId) == 0)
		{
			$aOrders = array('WRONGmemberId' => '<SPAN class=note>&nbsp;<i>(Mã không chính xác)</i></SPAN>', 'Money' => $_POST['txtMoney'], 'Status'.$_POST['radStatus'] => 'checked');
		}
		else 
		{
			//end kiem tra su ton tai cua user
			$aOrders = array();
			$aOrders['memberId'] = $_POST['txtmemberId'];
			$aOrders['Money'] = $_POST['txtMoney'];
			$aOrders['Status'] = $_POST['radStatus'];
			$oOrders = new clsOrders($aOrders);
			echo "<script>alert('Bạn đã thêm thành công hóa đơn mới vào hệ thống');window.location='?page=orders&do=add';</script>";
		}
		
	}
	else 
	{
		$aOrders = array('memberId' => '0', 'Money' => '0', 'Status0' => 'checked');
	}
	
	$add->assign('MAIN', $aOrders);
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>