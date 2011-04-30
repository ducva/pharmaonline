<?php
	class clsPaging
	{
		var $iTotalRecord;
		var $iMaxRecord;
		var	$iMaxPage;
		var $iCurPage;
		var $iCurRecord;
		function clsPaging($iTotalRec, $iMaxRec, $iMaxPag, &$listobject)
		{
			$this->iTotalRecord = $iTotalRec;
			$this->iMaxRecord = $iMaxRec;
			$this->iMaxPage = $iMaxPag;
			
			if($this->iTotalRecord > 0)
			{
				$this->iTotalPage = ceil($this->iTotalRecord / $this->iMaxRecord);
				if(isset($_GET['iPage']) && $_GET['iPage']!="")
					$this->iCurPage=$_GET['iPage'];
				else 
					$this->iCurPage=1;
				$this->iCurRecord = ($this->iCurPage * $this->iMaxRecord) - $this->iMaxRecord + 1;
				
				if($this->iTotalRecord > $this->iMaxRecord)
				{
					$sPaging = '<tr align=center><td width="30" style="padding:0px;"><strong>Trang: </strong></td>';
					
					if($this->iCurPage > 1)
						$sPaging .= '<td width="10" style="padding:5px;"><a href="?'.$this->sGetQueryString().'&iPage='.($this->iCurPage - 1).'"><strong><<</strong></a></td>';
					else 
						$sPaging .= '<td width="10" style="padding:5px;"><strong><<</strong></td>';
						
					if($this->iCurPage > (((($this->iMaxPage - 1) / 2)) + 1))
						$sPaging .= '<td width="10" style="padding:1px;"><a href="?'.$this->sGetQueryString().'&iPage=1">1</a>...</td>';
								
					for($j = 1; $j <= $this->iTotalPage; $j++)
					{
						if($j == $this->iCurPage)
							$sPaging .= '<td width="10" style="padding:2px;"><strong>['.$this->iCurPage.']</strong></td>';
						elseif($j >= ($this->iCurPage - (($this->iMaxPage - 1) / 2)) && $j <= ($this->iCurPage + (($this->iMaxPage - 1) / 2))) 	
							$sPaging .= '<td width="10" style="padding:2px;"><a href="?'.$this->sGetQueryString().'&iPage='.$j.'">'.$j.'</a></td>';
					}
					
					if($this->iCurPage < ($this->iTotalPage - (((($this->iMaxPage - 1) / 2)))))
						$sPaging .= '<td width="10" style="padding:1px;">...<a href="?'.$this->sGetQueryString().'&iPage='.$this->iTotalPage.'">'.$this->iTotalPage.'</a></td>';
								
					if($this->iCurPage < $this->iTotalPage)
						$sPaging .= '<td width="10" style="padding:5px;"><a href="?'.$this->sGetQueryString().'&iPage='.($this->iCurPage + 1).'"><strong>>></strong></a></td>';
					else 
						$sPaging .= '<td width="10" style="padding:5px;"><strong>>></strong></td>';
					
					$sPaging .= '</tr>';
					$listobject->assign('PAGING', $sPaging);
				}
				
			}
		}
		function bGetContent($iRun)
		{
			if(($iRun + 1)>=$this->iCurRecord && ($iRun + 1)<=$this->iTotalRecord && ($iRun + 1)<=$this->iCurPage*$this->iMaxRecord)
			{
				return true;
			}
			return false;
		}
		function sGetQueryString()
		{
			$sQueryString = $_SERVER['QUERY_STRING'];
			$sQueryString = preg_replace('/&iPage=\d*/', '', $sQueryString);
			return $sQueryString;
		}
	}
?>