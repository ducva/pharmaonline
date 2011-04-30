<?php	$oService=new XTemplate('html/modules/service/service.tpl');
	$service=new clsTable('intro');
	$aIntro=$service->select('','','','PageName="service"');
	$oService->assign('DETAIL',$aIntro[0]['Detail']);
	$oService->parse('MAIN');
	$HTMLContent=$oService->text('MAIN');
?>