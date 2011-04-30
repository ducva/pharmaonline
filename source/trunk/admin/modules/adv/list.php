<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
	$list = new XTemplate("html/modules/adv/list.tpl");
	$advertising = new clsTable('advertising');
	
	//do
	if(isset($_GET['action']))
	{
		switch ($_GET['action'])
		{
			case 'up':
				$aDoAdv = $advertising->select('', '', '', 'Id = '.$_GET['id']);
				$iPre = $aDoAdv[0]['Priority'] - 1;
				$aPreAdv = $advertising->select('', '', '', 'Position = '.$aDoAdv[0]['Position'].' and Priority = '.$iPre);
				$advertising->update('Priority = '.$iPre, 'Id = '.$_GET['id']);
				if(count($aPreAdv) > 0)
					$advertising->update('Priority = '.$aDoAdv[0]['Priority'], 'Id = '.$aPreAdv[0]['Id']);
				break;
			case 'down':
				$aDoAdv = $advertising->select('', '', '', 'Id = '.$_GET['id']);
				$iNext = $aDoAdv[0]['Priority'] + 1;
				$aNextAdv = $advertising->select('', '', '', 'Position = '.$aDoAdv[0]['Position'].' and Priority = '.$iNext);
				$advertising->update('Priority = '.$iNext, 'Id = '.$_GET['id']);
				if(count($aNextAdv) > 0)
					$advertising->update('Priority = '.$aDoAdv[0]['Priority'], 'Id = '.$aNextAdv[0]['Id']);
				break;
			case 'active':
				$advertising->update('Status = '.($_GET['status'] == 0 ? 1 : 0), 'Id = '.$_GET['id']);
				break;
			case 'delete':
				//del file
				$aDelAdv=$advertising->select('','','','Id = '.$_GET['id']);
				$sDir = ($aDelAdv[0]['Type'] == 1 ? 'images/' : 'flash/');
				$sFile = '../images/upload/adv/'.$sDir.$aDelAdv[0]['File'];
				if(is_file($sFile))
					unlink($sFile);
				//end del file
				$advertising->delete('Id = '.$_GET['id']);
				break;
		}
		echo '<script>window.location="?page=adv&do=list&position='.$_GET['position'].'&keyword='.$_GET['keyword'].'&iPage='.$_GET['iPage'].'";</script>';
	}
	//end do
	
	//search
	if(isset($_GET['keyword']) && $_GET['keyword'] != '')
	{
		$sKeyWord="Name like '%".$_GET['keyword']."%'";
	}
	else
		$sKeyWord="";
	$list->assign('KEYWORD', $_GET['keyword']);
	//end search
	
	//get list
	if(!isset($_GET['position']) || $_GET['position'] == '')
	{
		$aAdv = $advertising->select('', '', '', $sKeyWord, 'Name asc');
		$sLinkUp = '';
		$sLinkDown = '';
		$sUrlPosition = '';
	}
	else 
	{
		$sCondition = ($sKeyWord == '' ? 'Position = '.$_GET['position'] : 'Position = '.$_GET['position'].' and '.$sKeyWord);
		$aAdv = $advertising->select('', '', '', $sCondition, 'Priority asc');
		$sLinkUp = 'title=Lên href="?mod=adv&page=listadv&position='.$_GET['position'].'&keyword='.$_GET['keyword'].'&iPage='.$_GET['iPage'].'&do=up';
		$sLinkDown = 'title=Xuống href="?mod=adv&page=listadv&position='.$_GET['position'].'&keyword='.$_GET['keyword'].'&iPage='.$_GET['iPage'].'&do=down';
		$list->assign('SELECTED'.$_GET['position'], 'selected');
		$sUrlPosition = $_GET['position'];
	}
	$list->assign('URLPOSITION', $_GET['position']);
	$sNumAdv = count($aAdv);
	//end get list
	
	//paging
	$paging = new clsPaging($sNumAdv, 10, 5, $list);
		
	//assign
	for($i = 0; $i < $paging->iTotalRecord; $i++)
	{
		if($paging->bGetContent($i))
		{
			if(isset($_GET['position']) && $_GET['position'] != '')	
			{
				$sHrefUp = $sLinkUp.'&id='.$aAdv[$i]['Id'].'"';
				$sHrefDown = $sLinkDown.'&id='.$aAdv[$i]['Id'].'"';
				
			}
			else 
			{
				$sHrefUp = $sLinkUp;
				$sHrefDown = $sLinkDown;
			}
			$aGroupAdv = $advertising->select('', '', '', 'Position = '.$aAdv[$i]['Position'], 'Priority asc');
			$sNumGroupAdv = count($aGroupAdv);
			if($sNumGroupAdv > 1)
			{
				if($aAdv[$i]['Priority'] == $aGroupAdv[0]['Priority'])
				{
					$sUp="images/space.gif";
					$sDown="images/down.gif";
					$sHrefUp = '';
				}
				elseif($aAdv[$i]['Priority'] == $aGroupAdv[$sNumGroupAdv - 1]['Priority'])
				{
					$sUp="images/up.gif";
					$sDown="images/space.gif";
					$sHrefDown = '';
				}
				else
				{
					$sUp="images/up.gif";
					$sDown="images/down.gif";
				}
			}
			else 
			{
				$sUp="images/space.gif";
				$sDown="images/space.gif";
				$sHrefUp = '';
				$sHrefDown = '';
			}
			
			if($aAdv[$i]['Status'] == 1)
			{
				$sLock = "images/unlock.gif";
				$sHide = "Ẩn";	
			}
			else
			{
				$sLock = "images/lock.gif";
				$sHide = "Hiện";
			}
			
			
			switch ($aAdv[$i]['Position'])
			{
				case 1:
					$sPosition = 'Trái';
					break;	
				case 2:
					$sPosition = 'Phải';
					break;	
				case 3:
					$sPosition = 'Banner';
					break;	
				case 4:
					$sPosition = 'Giữa';
					break;		
			}
			$aListAdv = array('ID' => $aAdv[$i]['Id'], 'NAME' => $aAdv[$i]['Name'], 'POSITION' => $sPosition, 'TYPE' => ($aAdv[$i]['Type'] == 1) ? 'Ảnh' : 'Flash', 'LINK' => substr($aAdv[$i]['Link'], 0, 20), 'FILE' => $aAdv[$i]['File'], 'STATUS' => $aAdv[$i]['Status'], 'HREFUP' => $sHrefUp, 'HREFDOWN' => $sHrefDown, 'UP' => $sUp, 'DOWN' => $sDown, 'LOCK' => $sLock, 'URLPOSITION' => $sUrlPosition, 'IPAGE' => $_GET['iPage'], 'KEYWORD' => $_GET['keyword'], 'HIDE' => $sHide);
			$list->assign('LISTADV', $aListAdv);
			$list->parse('MAIN.LISTADV');
		}
	}
	//end assign
	//end paging
	
	 
	$list->parse('MAIN');
	$HTMLContent = $list->text('MAIN');
?>