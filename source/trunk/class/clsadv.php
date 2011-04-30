<?php
	class clsAdvertising
	{
		var $aAdvLeft;
		var $iNumAdvLeft;
		var $aAdvRight;
		var $iNumAdvRight;
		var $aAdvTop;
		var $iNumAdvTop;
		var $aAdvMiddle;
		var $iNumAdvMiddle;
		var $sDir;
		function clsAdvertising($sDir = '')
		{
			$advertising = new clsTable('advertising');
			$this->aAdvLeft = $advertising->select('', '', '', 'Position = 1 and Status = 1', 'Priority');
			$this->iNumAdvLeft=count($this->aAdvLeft);
			$this->aAdvRight = $advertising->select('', '', '', 'Position = 2 and Status = 1', 'Priority');
			$this->iNumAdvRight=count($this->aAdvRight);
			$this->aAdvTop = $advertising->select('', '', '', 'Position = 3 and Status = 1', 'Priority');
			$this->iNumAdvTop=count($this->aAdvTop);
			$this->aAdvMiddle = $advertising->select('', '', '', 'Position = 4 and Status = 1', 'Priority');
			$this->iNumAdvMiddle=count($this->aAdvMiddle);
			$this->sDir = $sDir;
		}
		function getLeft()
		{
			$iNum=$this->iNumAdvLeft;
			$sLeft = '<table border="0" width="100%" cellspacing="0" cellpadding="0">';
			for($i = 0; $i < $iNum; $i++)
			{
				if($this->aAdvLeft[$i])
				{
					if(substr($this->aAdvLeft[$i]['File'], -4, 4) == '.swf')
					{
						$sDir = 'images/upload/adv/flash/';
						$sLeft .= '<tr><td align="center" style="padding-top:2px; padding-bottom:2px;"><embed src="'.$this->sDir.$sDir.$this->aAdvLeft[$i]['File'].'" width="200"></embed></td></tr>';
					}
					else
					{
						$sDir = 'images/upload/adv/images/';
						$sLeft .= '<tr><td align="center" style="padding-top:2px; padding-bottom:2px;"><a href="'.$this->aAdvLeft[$i]['Link'].'"><img src="'.$this->sDir.$sDir.$this->aAdvLeft[$i]['File'].'" title="'.$this->aAdvLeft[$i]['Name'].'" width="200" border="0" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10)></a></td></tr>';
					}
				}
			}
			$sLeft .= '</table>';
			return $sLeft;
		}
		function getRight()
		{
			$iNum=$this->iNumAdvRight;
			$sRight = '<table border="0" width="185" cellspacing="0" cellpadding="0">';
			for($i = 0; $i < $iNum; $i++)
			{
				if($this->aAdvRight[$i])
				{
					if(substr($this->aAdvRight[$i]['File'], -4, 4) == '.swf')
					{
						$sDir = 'images/upload/adv/flash/';
						$sRight .= '<tr><td style="padding-top:2px; padding-bottom:2px;"><embed src="'.$this->sDir.$sDir.$this->aAdvRight[$i]['File'].'" width="185"></embed></td></tr>';
					}
					else
					{
						$sDir = 'images/upload/adv/images/';
						$sRight .= '<tr><td align="center" style="padding-top:2px; padding-bottom:2px;"><a href="'.$this->aAdvRight[$i]['Link'].'"><img border="0" src="'.$this->sDir.$sDir.$this->aAdvRight[$i]['File'].'" width="200" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10) title="'.$this->aAdvRight[$i]['Name'].'"></a></td></tr>';
					}
				}
			}
			$sRight .= '</table>';
			return $sRight;
		}
		function getTop()
		{
			$iNum=$this->iNumAdvTop;
			$sTop = '<table border="0" width="100%" cellspacing="0" cellpadding="0">';
			for($i = 0; $i < 4; $i++)
			{
				if($this->aAdvTop[$i])
				{
					if($i == 0 || $i == 2)
						$sTop .= '<tr>';
					if(substr($this->aAdvTop[$i]['File'], -4, 4) == '.swf')
					{
						$sDir = 'images/upload/adv/flash/';
						$sTop .= '<td style="padding-top:2px; padding-bottom:2px;"><a href="'.$this->aAdvTop[$i]['Link'].'"><script>Flashwrite("'.$this->sDir.$sDir.$this->aAdvTop[$i]['File'].'",570,243);</script></a></td>';
					}
					else
					{
						$sDir = 'images/upload/adv/images/';
						$sTop .= '<td style="padding-top:2px; padding-bottom:2px;"><a href="'.$this->aAdvTop[$i]['Link'].'"><img src="'.$this->sDir.$sDir.$this->aAdvTop[$i]['File'].'" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10) title="'.$this->aAdvTop[$i]['Name'].'" border="0"></a></td>';
					}
					if(($i == 0 || $i == 2) && (!$this->aAdvTop[$i + 1]))
						$sTop .= '</tr>';
					elseif($i == 1 || $i == 3)
						$sTop .= '</tr>';
				}
			}
			$sTop .= '</table>';
			return $sTop;
		}
		function getMiddle()
		{
			$iNum=$this->iNumAdvMiddle;
			$sMiddle = '<table border="0" width="570" cellspacing="0" cellpadding="0">';
			for($i = 0; $i < $iNum; $i++)
			{
				$sMiddle .= '<tr>';
				if($this->aAdvMiddle[$i])
				{
					if(substr($this->aAdvMiddle[$i]['File'], -4, 4) == '.swf')
					{
						$sDir = 'images/upload/adv/flash/';
						$sMiddle .= '<td ><a href="'.$this->aAdvMiddle[$i]['Link'].'"><script>Flashwrite("'.$this->sDir.$sDir.$this->aAdvMiddle[$i]['File'].'",570,243);</script></a></td>';
					}
					else
					{
						$sDir = 'images/upload/adv/images/';
						$sMiddle .= '<td valign="top"><a href="'.$this->aAdvMiddle[$i]['Link'].'"><img src="'.$this->sDir.$sDir.$this->aAdvMiddle[$i]['File'].'" width="570" border="0" onmouseover=nereidFade(this,60,10,10) style="FILTER: alpha(opacity=100)" onmouseout=nereidFade(this,100,10,10) title="'.$this->aAdvMiddle[$i]['Name'].'"></a></td>';
					}
					$sMiddle .= '</tr>';
				}
			}
			$sMiddle .= '</table>';
			return $sMiddle;
		}
	}
?>