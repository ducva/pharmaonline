<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$listorders=new XTemplate('html/modules/orders/list.tpl');
	$orders=new clsTable('orders');
	//delete / up / down
	if(isset($_GET['action']) && $_GET['action'] != '')
	{
		switch($_GET['action'])
		{
			case "delete":
				if($_GET['id']!="")
				{
					$orders->delete('Id = '.$_GET['id']);
					echo '<script>window.location = "?page=orders&do=list"</script>';
				}
				break;
			case 'active':
				$orders->update('Status = '.($_GET['status'] == 0 ? 1 : 0), 'Id = '.$_GET['id']);
				break;
		}
		
	}
	//end delete / up / down
	
	//cbo day
	for($i=1 ; $i <= 31 ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if($i < 10)
			$day = '0'.$i;
		else
			$day = $i;
		if(isset($_GET['keyword']) && substr($_GET['keyword'], 8, 2) == $day)
			$aArray['DAY'] = 'selected';
		$listorders->assign('DAY',$aArray);
		$listorders->parse('MAIN.DAY');
	}
	//end cbo day
	
	//cbo month
	for($i=1 ; $i <= 12 ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if($i < 10)
			$month = '0'.$i;
		else
			$month = $i;
		if(isset($_GET['keyword']) && substr($_GET['keyword'], 5, 2) == $month)
			$aArray['MONTH'] = 'selected';
		$listorders->assign('MONTH',$aArray);
		$listorders->parse('MAIN.MONTH');
	}
	//end cbo month
	
	//cbo year
	for($i=date("Y") ; $i >=2000  ; $i--)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if(isset($_GET['keyword']) && substr($_GET['keyword'], 0, 4) == $i)
			$aArray['YEAR'] = 'selected';
		$listorders->assign('YEAR',$aArray);
		$listorders->parse('MAIN.YEAR');
	}
	//end cbo year
	
	//search
	if(isset($_GET['keyword']) && $_GET['keyword'] != '')
	{
		$sKey = $_GET['keyword'];
		$sCondition="PayDate like '%".$sKey."%'";
	}
	else
		$sCondition="";
	//end search
	
	$aOrders=$orders->select('*,date_format(CreateDate,"%d-%m-%Y") as CreateDate, date_format(PayDate,"%d-%m-%Y") as PayDate','','',$sCondition, 'PayDate desc');
	$iLine=count($aOrders);

//phan trang
	$paging = new clsPaging($iLine, 10, 5, $listorders);
//end phan trang	
		
		for($i=0;$i<$iLine;$i++)
		{
			if($paging->bGetContent($i))
			{	
				//status
				if($aOrders[$i]['Status']==0)
				{
					$sLock="./images/unlock.gif";
					$sSubStatus = '<font color="#ff0000">Chưa thanh toán</font>';
				}
				else
				{
					$sLock="./images/lock.gif";
					$sSubStatus = 'Đã thanh toán';
				}
				//end status
				$member = new clsTable('member');
				$oMember = $member->select('FullName', '', '', 'Id = '.$aOrders[$i]['memberId']);
				$aArray = $aOrders[$i];
				$aArray['memberName'] = $oMember[0]['FullName'];
				$aArray['SubStatus'] = $sSubStatus;
				$aArray['LOCK'] = $sLock;
				$aArray['KEYWORD'] = $_GET['keyword'];
				$aArray['IPAGE'] = $_GET['iPage'];
				$listorders->assign('LISTORDERS',$aArray);
				$listorders->parse('MAIN.LISTORDERS');
			}
		}
	$listorders->parse('MAIN');
	$HTMLContent=$listorders->text('MAIN');	
?>