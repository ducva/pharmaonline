<?php	
	$oHome=new XTemplate('html/components/home/home.tpl');
	
	$oCategory=new clsTable('category');
	
	$aCategory=$oCategory->select('','','','HotCategory=1','Position asc');
	
	$iNumberCategory=count($aCategory);
	
	for($a=0 ; $a < $iNumberCategory ; $a++)
	{
		
		$aArray=array('NAME'=>$aCategory[$a]['Name']);
		$aChildCategory=$oCategory->select('','','','RootId='.$aCategory[$a]['Id'],'Position asc');
		$sListCategoryId=$aCategory[$a]['Id'].",";
		for($b=0 ; $b < count($aChildCategory) ; $b++)
		{
			$sListCategoryId.=$aChildCategory[$b]['Id']."','";
		}
		$oHome->assign('CATEGORY',$aArray);
		$product=new clsTable('product');
		
		//new dBug($sListCategoryId); 
		//die;
		$aHotProduct=$product->select("","","","HotProduct=2 and categoryId IN ('".$sListCategoryId."')","Orders desc");
		
		//new dBug($aHotProduct);die;
		$iLine=(count($aHotProduct)) > 4 ? 4 : count($aHotProduct);
		//echo $iLine.'<BR>';
		//phan trang
		$sLink='<a href="index.php?page=product&catid='.$aCategory[$a]['Id'].'&type=hot" class="lnkdirect1">Xem tiếp</a>';
		$iSPT=0;
		
		for($i=0 ; $i < $iLine ; $i++)
		{
			$iSPT++;
			$currency=new clsTable('currency');
			$aCurrency=$currency->select('','','','Id='.$aHotProduct[$i]['currencyId']);
			$aArray=array(
						'ID'=>$aHotProduct[$i]['Id'],
						'NAME'=>$aHotProduct[$i]['Name'],
						'DESCRIPTION'=>$aHotProduct[$i]['Description'],
						'PRICE'=>sPriceFormat($aHotProduct[$i]['Price']),
						'PRICEQTM'=>sPriceFormat($aHotProduct[$i]['PriceQTM']),
						'IMAGE'=>$aHotProduct[$i]['Image'],
						'CURRENCY'=>$aCurrency[0]['Name']
						);
			
			//new dBug($aArray);
			$oHome->assign('PRODUCTCOL',$aArray);
			$oHome->parse('MAIN.CATEGORY.PRODUCTROW.PRODUCTCOL');
			if($iSPT % 2 == 0)
				$oHome->parse('MAIN.CATEGORY.PRODUCTROW');
		
		}
		$oHome->parse('MAIN.CATEGORY.PRODUCTROW');
		if($iLine > 4){
			$oHome->parse('MAIN.CATEGORY.PRODUCTROW');
		}
		$oHome->assign('PAGING',$sLink);
		$oHome->parse('MAIN.CATEGORY');
	}
	
	$oHome->parse('MAIN');
	$HTMLHome=$oHome->text('MAIN');
?>