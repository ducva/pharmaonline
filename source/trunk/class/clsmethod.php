<?php
	class clsMethod
	{
		var $aVar = array();
		function clsMethod()
		{
			$oMethod = new clsTable('method');
			$aMethod = $oMethod->select();
			$this->aVar = $aMethod[0];
		}
		function Update($aThis)
		{
			$oMethod = new clsTable('method');
			if(gettype($aThis) == 'array')
			{
				$oMethod->update($this->sArrToStr($aThis), 'Id = '.$this->aVar['Id']);
				//$aMethod = $oMethod->select();
				//$this->aVar = $aMethod[0];
			}
		}
		function sArrToStr($aArray)
		{
			$sUpdate = '';
			while(list($key, $value) = each($aArray))
			{
				$sUpdate .= $key.' = "'.$value.'", ';
			}
			$sUpdate = substr($sUpdate, 0, strlen($sUpdate) - 2);
			return $sUpdate;
		}
	}
?>