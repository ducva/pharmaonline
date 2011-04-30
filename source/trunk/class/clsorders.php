<?php
	class clsOrders
	{
		var $aVar = array();
		var $aDetail = array();
		var $aMember = array();
		var $iMoney = 0;
		function clsOrders($iId)
		{
			$oOrders = new clsTable('orders');
			if(gettype($iId) == 'array')
			{
				$oOrders->insert('CreateDate, PayDate, Status, Money, memberId, Address', 'now(), now(), "'.$iId['Status'].'", "'.$iId['Money'].'", "'.$iId['memberId'].'", "'.$iId['Address'].'"');
			}
			else
			{
				$aOrders = $oOrders->select('*, date_format(CreateDate, "%d-%m-%Y") as CreateDate, date_format(PayDate, "%d-%m-%Y") as PayDate', '', '', 'Id = '.$iId);
				$this->aVar = $aOrders[0];
			}
		}
		function SetDetail()
		{
			$oOrdersDetail = new clsTable('ordersdetail');
			$this->aDetail = $oOrdersDetail->select('*, (Quantity * PriceQTM) as Money', 'product', 'F.productId = L.Id', 'F.ordersId = '.$this->aVar['Id'], 'L.Name');
			$oMember = new clsTable('member');
			$aMember = $oMember->select('', '', '', 'Id = '.$this->aVar['memberId']);
			$this->aMember = $aMember[0];
		}
		function Update($aThis)
		{
			$oOrders = new clsTable('orders');
			if(gettype($aThis) == 'array')
			{
				$oOrders->update($this->sArrToStr($aThis), 'Id = '.$this->aVar['Id']);
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