<?php	function sPriceFormat($iPrice)
	{
		//xu ly gia
		$sPrice;
		$aPrice=str_split($iPrice);
		$iSPT=count($aPrice);
		for($a=0; $a < $iSPT ; $a ++)
		{
			$b=$iSPT-$a;
			if($b % 3 ==0 && $a!=0  )
				$sPrice.=',';
			$sPrice.= $aPrice[$a];
		}
		return $sPrice;
		//end xu ly gia
	}
?>