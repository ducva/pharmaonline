<?php	$oHotproduct=new XTemplate('html/components/hotproduct/hotproduct.tpl');
	$product=new clsTable('product');
	$aHotProduct=$product->select('','','','HotProduct=1 and Status=1','CreateDate desc','0,10');
	$iLine=count($aHotProduct);
	
	for($i=0 ; $i < $iLine ; $i++)
	{
		$currency=new clsTable('currency');
		$aCurrency=$currency->select('','','','Id='.$aHotProduct[$i]['currencyId']);
		$aArray=array(
					'ID'=>$aHotProduct[$i]['Id'],
					'NAME'=>$aHotProduct[$i]['Name'],
					'IMAGE'=>$aHotProduct[$i]['Image'],
					'PRICE'=>sPriceFormat($aHotProduct[$i]['Price']),
					'CURRENCY'=>$aCurrency[0]['Name']
					);
		$oHotproduct->assign('HOTPRODUCT',$aArray);
		$oHotproduct->parse('MAIN.HOTPRODUCT');
	}
	
	$oHotproduct->parse('MAIN');
	$HTMLHotproduct=$oHotproduct->text('MAIN');
?>