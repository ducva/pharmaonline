<?php
	class clsMember
	{
		var $aVar = array();
		var $aChild = array();
		var $iTotalMoney = 0;
		var $iPoint = 0;
		var $iTotalPoint = 0;
		var $fProfit = 0;
		var $iRate = 0;
		var $iPercent = 0;
		var $sDate;
		var $sTree = '';
		var $sTreeUser = '';
		function clsMember($id = 0, $date = '')
		{
			$this->sDate = $date;
			$oMember = new clsTable('member');
			if(gettype($id) == 'array')
			{
				if(!isset($id['Id']) || $id['Id'] == '')
				{
					$id['Status'] = 1;
					$id['RootId'] = (($id['RootId'] == '' || $id['RootId'] < 0) ? 0 : $id['RootId']);
					$oMember->insert('Username, Password, Fullname, BirthDate, JoinDate, Email, Telephone, Mobile, Address, Status, RootId','"'.$id['Username'].'", "'.md5($id['Password']).'", "'.$id['Fullname'].'", "'.$id['BirthDate'].'", now(), "'.$id['Email'].'", "'.$id['Telephone'].'", "'.$id['Mobile'].'", "'.$id['Address'].'", "'.$id['Status'].'", "'.$id['RootId'].'"');
					/*$this->aVar['Id'] = $oMember->InsertId;
					$aInsertMember = $oMember->select('*, date_format(BirthDate, "%d-%m-%Y") as BirthDate, date_format(BirthDate, "%d") as BirthDay, date_format(BirthDate, "%m") as BirthMonth, date_format(BirthDate, "%Y") as BirthYear, date_format(JoinDate, "%d-%m-%Y") as JoinDate', '', '', 'Id = '.$this->aVar['Id']);
					$this->aVar = $aInsertMember[0];
					$this->aVar['RootId'] = ($this->aVar['RootId'] == '' ? 0 : $this->aVar['RootId']);
					$this->SetPoint();
					$this->SetChild();
					$this->SetProfit();	
					$this->MakeTree();*/
				}
				else 
				{
					$this->aVar = $id;
					$this->SetPoint();
					$this->SetChild();
					$this->SetProfit();	
					$this->MakeTree();
					$this->MakeTreeUser();
					
				}
			}
			else
			{
				$aThisMember = $oMember->select('*, date_format(BirthDate, "%d-%m-%Y") as BirthDate, date_format(BirthDate, "%d") as BirthDay, date_format(BirthDate, "%m") as BirthMonth, date_format(BirthDate, "%Y") as BirthYear, date_format(JoinDate, "%d-%m-%Y") as JoinDate', '', '', 'Id = '.$id); 
				if(count($aThisMember) > 0)
				{
					$this->aVar = $aThisMember[0];
					//$this->aVar['RootId'] = ($this->aVar['RootId'] == '' ? 0 : $this->aVar['RootId']);
				}
				else 
				{
					$this->aVar['Id'] = 0;
					$this->aVar['Username'] = 'Admin';
					$this->aVar['RootId'] = -1;
				}
				$this->SetPoint();
				$this->SetChild();
				$this->SetProfit();	
				$this->MakeTree();
				$this->MakeTreeUser();
				
			}
		}
		function SetPoint()
		{
			$this->sDate = ($this->sDate == '' ? date('m-Y') : $this->sDate);
			$sDateCondition = ($this->sDate == 'all' ? '' : ' and date_format(PayDate, "%m-%Y") = "'.$this->sDate.'"');
			$oOrders = new clsTable('orders');
			$aTotalMoney = $oOrders->select('memberId, sum(Money) as TotalMoney', '', '', 'memberId = '.$this->aVar['Id'].$sDateCondition.' and Status = 1 group by memberId');
			if(count($aTotalMoney) > 0)
			{
				$oMethod = new clsTable('method');
				$aMethod = $oMethod->select();
				$this->iTotalMoney = $aTotalMoney[0]['TotalMoney'];
				$this->iPoint = floor($this->iTotalMoney / $aMethod[0]['Money']);
			}
		}
		function SetChild()
		{
			$oMember = new clsTable('member');
			$this->iTotalPoint = $this->iPoint;		
			$aChildMember = $oMember->select('', '', '', 'RootId = '.$this->aVar['Id'], 'Id asc');
			if(count($aChildMember) > 0)
			{
				for($i = 0; $i < count($aChildMember); $i++)
				{
					$this->aChild[$i] = new clsMember($aChildMember[$i]['Id'], $this->sDate);
					$this->iTotalPoint += $this->aChild[$i]->iTotalPoint;
				}
			}
		}
		function SetProfit()
		{
			$oMethod = new clsTable('method');
			$aMethod = $oMethod->select();
			$oRate = new clsTable('rate');
			$aRate = $oRate->select('', '', '', 'Point < '.$this->iTotalPoint, 'Point desc');
			$this->iPercent = (count($aRate) > 0 ? $aRate[0]['Percent'] : 0);
			$this->fProfit = ($this->iTotalPoint * $this->iPercent) / 100; 
			if(count($this->aChild) > 0)
			{
				for($i = 0; $i < count($this->aChild); $i++)
				{
					$this->fProfit -= (($this->aChild[$i]->iTotalPoint * $this->aChild[$i]->iPercent) / 100);
				}
			}
		}
		function Update($aThis)
		{
			if(gettype($aThis) == 'array')
			{
				if($this->aVar['Id'] > 0)
				{
					$oMember = new clsTable('member');
					$aThis['Status'] = 1;
					$aThis['RootId'] = (($aThis['RootId'] == '' || $aThis['RootId'] < 0) ? 0 : $aThis['RootId']);
					if($aThis['Password'] != '')
						$oMember->update('Username = "'.$aThis['Username'].'", Password = "'.md5($aThis['Password']).'", Fullname = "'.$aThis['Fullname'].'", BirthDate = "'.$aThis['BirthDate'].'", Email = "'.$aThis['Email'].'", Telephone = "'.$aThis['Telephone'].'", Mobile = "'.$aThis['Mobile'].'", Address = "'.$aThis['Address'].'", Status = "'.$aThis['Status'].'", RootId = "'.$aThis['RootId'].'"', 'Id = '.$this->aVar['Id']);
					else 	
						$oMember->update('Username = "'.$aThis['Username'].'", Fullname = "'.$aThis['Fullname'].'", BirthDate = "'.$aThis['BirthDate'].'", Email = "'.$aThis['Email'].'", Telephone = "'.$aThis['Telephone'].'", Mobile = "'.$aThis['Mobile'].'", Address = "'.$aThis['Address'].'", Status = "'.$aThis['Status'].'", RootId = "'.$aThis['RootId'].'"', 'Id = '.$this->aVar['Id']);
					//$this->Reset();
				}
			}
		}
		function Reset()
		{
			$oMember = new clsTable('member');
			$aThisMember = $oMember->select('*, date_format(BirthDate, "%d-%m-%Y") as BirthDate, date_format(BirthDate, "%d") as BirthDay, date_format(BirthDate, "%m") as BirthMonth, date_format(BirthDate, "%Y") as BirthYear, date_format(JoinDate, "%d-%m-%Y") as JoinDate', '', '', 'Id = '.$this->aVar['Id']); 
			if(count($aThisMember) > 0)
			{
				$this->aVar = $aThisMember[0];
				//$this->aVar['RootId'] = ($this->aVar['RootId'] == '' ? 0 : $this->aVar['RootId']);
			}
			$this->SetPoint();
			$this->SetChild();
			$this->SetProfit();	
			$this->MakeTree();
			$this->MakeBackBone();
		}
		function MakeTree()
		{
			$this->sTree .= '<table border="0" cellpadding="0" cellspacing="0"><tr><td><a href="?page=member&do=detail&id='.$this->aVar['Id'].'" style="text-decoration: none;">&nbsp;['.$this->aVar['Id'].'] '.$this->aVar['Username'].'&nbsp;</a></td>';
			if(count($this->aChild) > 0)
			{
				$this->sTree .= '<td><table border="0" cellpadding="0" cellspacing="0" style="border-left: solid 1px #FF0000;">';
				for($i = 0; $i < count($this->aChild); $i++)
				{
					$this->sTree .= '<tr><td>'.$this->aChild[$i]->sTree.'</td></tr>';
				}
				$this->sTree .= '</table></td>';
			}
			$this->sTree .= '</tr></table>';
		}
		
		function MakeTreeUser()
		{
			$this->sTreeUser .= '<table border="0" cellpadding="0" cellspacing="0"><tr><td><a href="#" style="text-decoration: none;">&nbsp;['.$this->aVar['Id'].'] '.$this->aVar['Username'].'&nbsp;</a></td>';
			if(count($this->aChild) > 0)
			{
				$this->sTreeUser .= '<td><table border="0" cellpadding="0" cellspacing="0" style="border-left: solid 1px #FF0000;">';
				for($i = 0; $i < count($this->aChild); $i++)
				{
					$this->sTreeUser .= '<tr><td>'.$this->aChild[$i]->sTreeUser.'</td></tr>';
				}
				$this->sTreeUser .= '</table></td>';
			}
			$this->sTreeUser .= '</tr></table>';
		}
		
	}

?>