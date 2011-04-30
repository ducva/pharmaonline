<?php	class clsCart
	{
		var $sProductId;
		var $iTotalMoney=0;
		var $iTotalProduct;
		var $aQuantity;
		
		function clsCart($aArray)
		{
			if(is_array($aArray))
			{
				while(list($key,$value)=each($aArray))
				{
					$this->sProductId.=$key.',';
					$this->aQuantity[$key]=$value;
				}
				$this->iTotalProduct=count($aArray);
				//$this->aGetProduct();
			}
		}
		
		function aGetProduct()
		{
			$aArray=array();
			$this->iTotalMoney=0;
			$product=new clsTable('product');
			$iSPT=0;
			$aProductId=str_replace(",","','",$this->sProductId);
			$aProduct=$product->select("","","","Id IN ('".$aProductId."')");
			$iLine=count($aProduct);
			for($i=0; $i < $iLine ; $i++)
			{
				$iSPT++;
				$currency=new clsTable('currency');
				$aCurrency=$currency->select('','','','Id='.$aProduct[$i]['currencyId']);
				$sPrice=$aCurrency[0]['Rate']*$aProduct[$i]['PriceQTM']*$this->aQuantity[$aProduct[$i]['Id']];
				$aArray[$i]=array(
							'STT'=>$iSPT,
							'ID'=>$aProduct[$i]['Id'],
							'NAME'=>$aProduct[$i]['Name'],
							'PRICEQTM'=>sPriceFormat($aProduct[$i]['PriceQTM']),
							'QUANTITY'=>$this->aQuantity[$aProduct[$i]['Id']],
							'CURRENCY'=>$aCurrency[0]['Name'],
							'TOTAL'=>sPriceFormat($sPrice)
							);
				$this->iTotalMoney+=$sPrice;
			}
			return $aArray;
		}
		
		function iGetTotalProduct()
		{
			$aTotalProductId=explode(",",$this->sProductId);
			return (count($aTotalProductId)-1);
		}
		
		function iGetTotalMoney()
		{
			$this->aGetProduct();
			return $this->iTotalMoney;
		}
	}
?>