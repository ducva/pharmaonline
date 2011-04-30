<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
	$detail = new XTemplate('html/modules/orders/detail.tpl');
	$oOrders = new clsOrders($_GET['id']);
	
	$oOrders->SetDetail();
	$aMainArray = $oOrders->aMember;
	
	$aMainArray['CreateDate'] = $oOrders->aVar['CreateDate'];
	$aMainArray['Money'] = $oOrders->aVar['Money'];
	$aMainArray['OrderId'] = $oOrders->aVar['Id'];
	$aMainArray['Address'] = $oOrders->aVar['Address'];
	$detail->assign('MAIN', $aMainArray);
	
	for($i = 0; $i < count($oOrders->aDetail); $i++)
	{
		$aArray = $oOrders->aDetail[$i];
		$detail->assign('LISTDETAIL', $aArray);
		$detail->parse('MAIN.LISTDETAIL');
	}
	$detail->parse('MAIN');
	$HTMLContent = $detail->text('MAIN');
?>