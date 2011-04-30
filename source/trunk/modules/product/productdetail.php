<?php	$oProductDetail=new XTemplate('html/modules/product/productdetail.tpl');
	include "components/product/productdetail/toolbar.php";
	$oProductDetail->assign('TOOLBAR',$sToolbar);
	
	$iProductId=$_GET['proid'];
	$product=new clsTable('product');
	$aProduct=$product->select('','','','Id='.$iProductId);
	
	//ten nhom sp
	$category=new clsTable('category');
	$aCategory=$category->select('','','','Id='.$aProduct[0]['categoryId']);
	//end ten nhom sp
	
	//manufacturer
	$manufacturer=new clsTable('manufacturer');
	$aManufacturer=$manufacturer->select('','','','Id='.$aProduct[0]['manufacturerId']);
	//end manufacturer
	
	//provider
	$provider=new clsTable('provider');
	$aProvider=$provider->select('','','','Id='.$aProduct[0]['providerId']);
	//end provider
	
	//property
	$productproperty=new clsTable('productproperty');
	$aProductProperty=$productproperty->select('F.Value as Value,L.Name as Name,L.Unit as Unit','property','F.propertyId=L.Id','F.productId='.$iProductId);
	$iLine=count($aProductProperty);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'VALUE'=>$aProductProperty[$i]['Value'],
					'NAME'=>$aProductProperty[$i]['Name'],
					'UNIT'=>$aProductProperty[$i]['Unit']
					);
		$oProductDetail->assign('LISTPROPERTY',$aArray);
		$oProductDetail->parse('MAIN.LISTPROPERTY');
	}
	//end property
	
	$currency=new clsTable('currency');
	$aCurrency=$currency->select('','','','Id='.$aProduct[0]['currencyId']);
	
	$unit=new clsTable('unit');
	$aUnit=$unit->select('','','','Id='.$aProduct[0]['unitId']);
	
	$sStatus=$aProduct[0]['Status']==1 ? 'Đang bán' : 'Hết hàng';
	
	$iViews=$aProduct[0]['Views'];
	$iViews++;
	
	//update views
	$product->update("Views='".$iViews."'","Id=".$aProduct[0]['Id']);
	//end update views
	
	$oProductDetail->assign('ID',$aProduct[0]['Id']);
	$oProductDetail->assign('CODE',$aProduct[0]['Code']);
	$oProductDetail->assign('NAME',$aProduct[0]['Name']);
	$oProductDetail->assign('CATEGORYNAME',$aCategory[0]['Name']);
	$oProductDetail->assign('MANUFACTURER',$aManufacturer[0]['Name']);
	$oProductDetail->assign('PROVIDER',$aProvider[0]['Name']);
	$oProductDetail->assign('IMAGE',$aProduct[0]['Image']);
	$oProductDetail->assign('PRICE',sPriceFormat($aProduct[0]['Price']));
	$oProductDetail->assign('PRICEQTM',sPriceFormat($aProduct[0]['PriceQTM']));
	$oProductDetail->assign('IMAGENOTE',$aProduct[0]['ImageNote']);
	$oProductDetail->assign('DESCRIPTION',$aProduct[0]['Description']);
	$oProductDetail->assign('VIEWS',$iViews);
	$oProductDetail->assign('DETAIL',$aProduct[0]['Detail']);
	$oProductDetail->assign('CURRENCY',$aCurrency[0]['Name']);
	$oProductDetail->assign('UNIT',$aUnit[0]['Name']);
	$oProductDetail->assign('STATUS',$sStatus);
	
	//same categoryproduct
	$aSameCategoryProduct=$product->select('','','','categoryId='.$aProduct[0]['categoryId']);
	$iLine=count($aSameCategoryProduct);
	
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aSameCategoryProduct[$i]['Id']==$aProduct[0]['Id'])
			$sSelected='selected';
		else 	
			$sSelected='';
		$aArray=array(
				'ID'=> $aSameCategoryProduct[$i]['Id'],
				'NAME'=> $aSameCategoryProduct[$i]['Name'],
				'SELECTED'=>$sSelected
				);
				
		$oProductDetail->assign('SAMECATEGOYPRODUCT',$aArray);
		$oProductDetail->parse('MAIN.SAMECATEGOYPRODUCT');
	}
	//end same categoryproduct
	
	$oProductDetail->parse('MAIN');
	$HTMLContent=$oProductDetail->text('MAIN');
?>