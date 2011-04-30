<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/rules/list.tpl');
	
	$sLink="?page=rules&do=list";
	$rules=new clsTable('rules');
	if(isset($_GET['iPage']) && $_GET['iPage'] !="")
		$sPage='&iPage='.$_GET['iPage'];
	else 	
		$sPage="";
	
	$sDo=$_GET['action'];
	switch($sDo)
	{
		case 'down':
				$iOldPos=$_GET['pos'];
				$iNewPos=$_GET['pos'] + 1;
				//lay id cua rules phia duoi
				$aRulesDown=$rules->select('','','','Position='.$iNewPos);
				//update vi tri cho rules tim dc
				$rules->update("Position='".$iOldPos."'","Id=".$aRulesDown[0]['Id']);
				//update vi tri cua rules vua chon
				$rules->update("Position='".$iNewPos."'","Id=".$_GET['id']);
				$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
				$list->assign('MESSAGE',$sMessage);
			break;
		case 'up':
				$iOldPos=$_GET['pos'];
				$iNewPos=$_GET['pos'] - 1;
				//lay id cua rules phia duoi
				$aRulesUp=$rules->select('','','','Position='.$iNewPos);
				//update vi tri cho rules tim dc
				$rules->update("Position='".$iOldPos."'","Id=".$aRulesUp[0]['Id']);
				//update vi tri cua rules vua chon
				$rules->update("Position='".$iNewPos."'","Id=".$_GET['id']);
				$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
				$list->assign('MESSAGE',$sMessage);
			break;
		case 'delete':
				//xoa
				if($_GET['id'] !='')
				{
					$rules->delete('Id='.$_GET['id']);
					$sMessage="<script>alert('Xóa thành công!');window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end xoa
			break;
		case 'status':
				$iStatus=($_GET['status'] <= 1) ? $_GET['status'] : 1;
				if($_GET['id'] !='')
				{
					$iStatus= 1 - $iStatus;
					$rules->update('Status='.$iStatus,'Id='.$_GET['id']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
			break;
	}
	
	//search
	if(isset($_POST['txtKeyword']) || isset($_GET['Key']))
	{
		$sKey=isset($_POST['txtKeyword']) ? $_POST['txtKeyword'] : $_GET['Key'];
		$sCondition="Name like '%".$sKey."%' or Detail like '%".$sKey."%'";
		$sLink.="&Key=".$sKey;
	}
	else
		$sCondition="";
	//end search
	
	$aRules=$rules->select('*,date_format(WriteDate,"%d-%m-%Y") as WriteDate','','',$sCondition,'Position asc');
	$iLine=count($aRules);

//phan trang
	$paging="";
	$maxRecord=20;
	$CurPage="";
	if(isset($_GET['iPage']) && $_GET['iPage']!="")
	{
		$CurPage=$_GET['iPage'];
	}
	else $CurPage=1;
	$CurRecord=($CurPage-1)* $maxRecord+1;
	$stt=0;
	$TotalRecord=$iLine;
	if ($TotalRecord > 0)
	{
		$TotalPage=$TotalRecord / $maxRecord;
		if ($TotalRecord % $maxRecord !=0) $TotalPage +=1;
	
		if ($TotalRecord > $maxRecord)
		{
			$maxPage=5;
			$paging.="Trang: ";
			
			if($CurPage > 1) $paging.="<a href='".$sLink."&iPage=".($CurPage-1)."'>Trước</a>&nbsp;&nbsp;";
			if ($CurPage > $maxPage) $paging.="<a href='".$sLink."&iPage=1'>1</a>...";
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
					$paging.="<a href='".$sLink."&iPage=".$j."'>".$j."</a>&nbsp;&nbsp;";
				}
			}
			if ($CurPage < ((int)$TotalPage)-3) $paging.="... <a href='".$sLink."&iPage=".((int)$TotalPage)."'>".((int)$TotalPage)."</a>&nbsp;&nbsp;";
			if ($CurPage < $TotalPage-1) $paging.="<a href='".$sLink."&iPage=".($CurPage+1)."'>Sau</a>";
		
		}
//end phan trang	
		
		for($i=0;$i<$iLine;$i++)
		{
			$stt++;
			if($stt>=$CurRecord && $stt<=$TotalRecord && $stt<=$CurPage*$maxRecord)
			{	
			
				//up/down
				if($iLine > 1)
				{
					if($i==0)
					{
						$sUp='';
						$sDown='<a href="'.$sLink.'&id='.$aRules[$i]['Id'].'&action=down&pos='.$aRules[$i]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
					}
					else
						if($i < $iLine - 1)
						{
							$sUp='<a href="'.$sLink.'&id='.$aRules[$i]['Id'].'&action=up&pos='.$aRules[$i]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
							$sDown='<a href="'.$sLink.'&id='.$aRules[$i]['Id'].'&action=down&pos='.$aRules[$i]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
						}
						else
						{
							$sUp='<a href="'.$sLink.'&id='.$aRules[$i]['Id'].'&action=up&pos='.$aRules[$i]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
							$sDown='';
						}
				}	
				//end up/down
			
				//status
				if($aRules[$i]['Status']==1)
					$sLock="images/unlock.gif";
				else
					$sLock="images/lock.gif";
				//end status
							
				$aArray[$i]= array(
									'UP'=>$sUp,
									'DOWN'=>$sDown,
									'ID'=>$aRules[$i]['Id'] , 
									'NAME'=>$aRules[$i]['Name'] , 
									'WRITEDATE'=>$aRules[$i]['WriteDate'],
									'STATUS'=>$aRules[$i]['Status'],
									'LOCK'=>$sLock );
				$list->assign('LISTRULES',$aArray[$i]);
				$list->parse('MAIN.LISTRULES');
			}
		}
		$list->assign('PAGING',$paging);
	}
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>