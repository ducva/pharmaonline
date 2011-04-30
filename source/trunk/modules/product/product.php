<?php	$oProduct=new XTemplate('html/modules/product/product.tpl');
	
	include "components/product/product/toolbar.php";
	$oProduct->assign('TOOLBAR',$sToolbar);
	$sLink='index.php?page=product';
	$product=new clsTable('product');
	
	$iCategoryId=$_GET['catid'];
	
	//tim kiem
	if(isset($_GET['keyword']))
	{
		$sKeyword=" and (Name like '%".$_GET['keyword']."%' or Description like '%".$_GET['keyword']."%' or Detail like '%".$_GET['keyword']."%')";
		$sLink.='&keyword='.$_GET['keyword'];
	}
	else
		$sKeyword="";
	//tim kiem
	if($iCategoryId !=0 && $iCategoryId !="")
	{
		//neu danh muc chon la danh muc cha
		$aCategory=$category->select('','','','Id='.$iCategoryId);
		if($aCategory[0]['RootId']==0)
		{
			$aChildCategory=$category->select('','','','RootId='.$iCategoryId);
			$iLine=count($aChildCategory);
			$sListCategoryId="";
			for($i=0 ; $i < $iLine ; $i++)
			{
				$sListCategoryId.="'".$aChildCategory[$i]['Id']."',";
			}
			$sCondition="Status=1 and categoryId IN (".$sListCategoryId."'') or categoryId=".$iCategoryId.$sKeyword;
		}
		//end danh muc cha
		else 
		{
			$sCondition="Status=1 and categoryId=".$iCategoryId.$sKeyword;
		}
	}
	else
		$sCondition="Status=1".$sKeyword;
	$sLink.='&catid='.$iCategoryId;
	
	$aProduct=$product->select("","","",$sCondition,"CreateDate desc");
	$iLine=count($aProduct);
//phan trang
	if($iLine > 0)
	{
		$paging="";
		$maxRecord=20;
		$CurPage="";
		if(isset($_GET['iPage']) && $_GET['iPage']!="")
		{
			$CurPage=$_GET['iPage'];
		}
		else $CurPage=1;
		$CurRecord=($CurPage-1)* $maxRecord+1;
		
		$TotalRecord=$iLine;
		if ($TotalRecord > 0)
		{
			$TotalPage=$TotalRecord / $maxRecord;
			if ($TotalRecord % $maxRecord !=0) $TotalPage +=1;
		
			if ($TotalRecord > $maxRecord)
			{
				$maxPage=5;
				$paging.="Trang: ";
				
				if($CurPage > 1) $paging.="<a href='".$sLink."&iPage=".($CurPage-1)."' class='lnkdirect1'>Trước</a>&nbsp;&nbsp;";
				if ($CurPage > $maxPage) $paging.="<a href='".$sLink."&iPage=1' class='lnkdirect1'>1</a>...";
				for($j=1;$j<=$TotalPage;$j++)
				{
					if($j==$CurPage)
					{	
						$paging.="[".$j."]&nbsp;&nbsp;";
						continue;
					}
					//else if(($j>((int)($CurPage-1)/$maxPage * $maxPage)) && ($j<=((int)(($CurPage-1)/$maxPage+1)*$maxPage)))
					if ($j>=$CurPage-2 && $j<=$CurPage+2)
					{
						$paging.="<a href='".$sLink."&iPage=".$j."' class='lnkdirect1'>".$j."</a>&nbsp;&nbsp;";
					}
				}
				if ($CurPage < ((int)$TotalPage)-3) $paging.="... <a href='".$sLink."&iPage=".((int)$TotalPage)."' class='lnkdirect1'>".((int)$TotalPage)."</a>&nbsp;&nbsp;";
				if ($CurPage < $TotalPage-1) $paging.="<a href='".$sLink."&iPage=".($CurPage+1)."' class='lnkdirect1'>Sau</a>";
			
			}
	//end phan trang
		
		
			$iSPT=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				$iSPT++;
				if($iSPT>=$CurRecord && $iSPT<=$TotalRecord && $iSPT<=$CurPage*$maxRecord)
				{
					if($aProduct[$i]['HotProduct']==1)
						$sSaleImage='<tr><td colspan="3" style="padding-left:15px;"><img src="images/sale.gif" align="absmiddle" /></td> </tr>';
					else 
						$sSaleImage='';
					$currency=new clsTable('currency');
					$aCurrency=$currency->select('','','','Id='.$aProduct[$i]['currencyId']);
					$aArray=array(
								'ID'=>$aProduct[$i]['Id'],
								'CODE'=>$aProduct[$i]['Code'],
								'NAME'=>$aProduct[$i]['Name'],
								'DESCRIPTION'=>$aProduct[$i]['Description'],
								'PRICE'=>sPriceFormat($aProduct[$i]['Price']),
								'PRICEQTM'=>sPriceFormat($aProduct[$i]['PriceQTM']),
								'IMAGE'=>$aProduct[$i]['Image'],
								'SALEIMAGE'=>$sSaleImage,
								'CURRENCY'=>$aCurrency[0]['Name']
								);
					$oProduct->assign('PRODUCTCOL',$aArray);
					$oProduct->parse('MAIN.PRODUCTROW.PRODUCTCOL');
					if($iSPT % 2 == 0)
						$oProduct->parse('MAIN.PRODUCTROW');
				}
				
			}
			$oProduct->assign('PAGING',$paging);
		}
	}
	else 
		$oProduct->parse('MAIN.PRODUCTROW.NOPRODUCT');	
	
	$oProduct->parse('MAIN.PRODUCTROW');
	$oProduct->parse('MAIN');
	$HTMLContent=$oProduct->text('MAIN');
?>