<?php	$oSaleproduct=new XTemplate('html/components/saleproduct/saleproduct.tpl');
	$product=new clsTable('product');
	$aSaleproduct=$product->select('','','','HotProduct=1 and Status=1','CreateDate desc','0,10');
	$iLine=count($aSaleproduct);
	$iMax=($iLine > 15) ? 15 : $iLine;
	for($i=0 ; $i < $iMax ; $i++)
	{
		$currency=new clsTable('currency');
		$aCurrency=$currency->select('','','','Id='.$aSaleproduct[$i]['currencyId']);
		$aArray=array(
					'ID'=>$aSaleproduct[$i]['Id'],
					'NAME'=>$aSaleproduct[$i]['Name'],
					'IMAGE'=>$aSaleproduct[$i]['Image'],
					'PRICE'=>sPriceFormat($aSaleproduct[$i]['Price']),
					'PRICEQTM'=>sPriceFormat($aSaleproduct[$i]['PriceQTM']),
					'CURRENCY'=>$aCurrency[0]['Name']
					);
		$oSaleproduct->assign('SALEPRODUCT',$aArray);
		$oSaleproduct->parse('MAIN.SALEPRODUCT');
	}
	if($iLine > $iMax)
		$oSaleproduct->parse('MAIN.CONTINUE');
	$oSaleproduct->parse('MAIN');
	$HTMLSaleproduct=$oSaleproduct->text('MAIN');
?>