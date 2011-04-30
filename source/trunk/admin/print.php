<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
	include "../classdatabase/clsDatabase.php";
	include "../classdatabase/clstable.php";
	include "../include/publics.php";
	include "../class/clsmember.php";
	include "../class/clsmethod.php";
	include "../class/clsorders.php";
	include "../class/clspaging.php";
	include "include/xtpl.php";
	
	$detail = new XTemplate('html/print.tpl');
	$oOrders = new clsOrders($_GET['id']);
	
	$oOrders->SetDetail();
	$aMainArray = $oOrders->aMember;
	
	$aMainArray['CreateDate'] = $oOrders->aVar['CreateDate'];
	$aMainArray['Money'] = $oOrders->aVar['Money'];
	$aMainArray['OrderId'] = $oOrders->aVar['Id'];
	$aMainArray['Day'] = date("d");
	$aMainArray['Month'] = date("m");
	$aMainArray['Year'] = date("Y");
	$detail->assign('MAIN', $aMainArray);
	
	for($i = 0; $i < count($oOrders->aDetail); $i++)
	{
		$aArray = $oOrders->aDetail[$i];
		$detail->assign('LISTDETAIL', $aArray);
		$detail->parse('MAIN.LISTDETAIL');
	}
	$detail->parse('MAIN');
	$detail->out('MAIN');
?>