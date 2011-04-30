<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/property/list.tpl');
	
	
	$sLink="?page=property&do=list";
	if(isset($_GET['iPage']) && $_GET['iPage'] !="")
		$sPage='&iPage='.$_GET['iPage'];
	else 	
		$sPage="";
	$property=new clsTable('property');
	
	$sDo=$_GET['action'];
	switch($sDo)
	{
		case 'down':
				//neu la danh muc cha
				$aProperty=$property->select('','','','Id='.$_GET['id']);
				if($aProperty[0]['RootId']==0)
				{
					$iOldPos=$_GET['pos'];
					$iNewPos=$_GET['pos'] + 1;
					//lay id cua danh muc phia duoi
					$aPropertyDown=$property->select('','','','Position='.$iNewPos.' and RootId=0');
					//update vi tri cho danh muc tim dc
					$property->update("Position='".$iOldPos."'","Id=".$aPropertyDown[0]['Id'].' and RootId=0');
					//update vi tri co danh muc vua chon
					$property->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId=0');
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end la danh muc cha
				//neu la danh muc con
				else 
				{
					$iOldPos=$_GET['pos'];
					$iNewPos=$_GET['pos'] + 1;
					//lay id cua danh muc phia duoi
					$aPropertyDown=$property->select('','','','Position='.$iNewPos.' and RootId='.$aProperty[0]['RootId']);
					//update vi tri cho danh muc tim dc
					$property->update("Position='".$iOldPos."'","Id=".$aPropertyDown[0]['Id'].' and RootId='.$aProperty[0]['RootId']);
					//update vi tri co danh muc vua chon
					$property->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId='.$aProperty[0]['RootId']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end la danh muc con
			break;
		case 'up':
				//neu la danh muc cha
				$aProperty=$property->select('','','','Id='.$_GET['id']);
				if($aProperty[0]['RootId']==0)
				{
					$iOldPos=$_GET['pos'];
					$iNewPos=$_GET['pos'] - 1;
					//lay id cua danh muc phia duoi
					$aPropertyUp=$property->select('','','','Position='.$iNewPos.' and RootId=0');
					//update vi tri cho danh muc tim dc
					$property->update("Position='".$iOldPos."'","Id=".$aPropertyUp[0]['Id'].' and RootId=0');
					//update vi tri co danh muc vua chon
					$property->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId=0');
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end la danh muc cha
				//neu la danh muc con
				else 
				{
					$iOldPos=$_GET['pos'];
					$iNewPos=$_GET['pos'] - 1;
					//lay id cua danh muc phia duoi
					$aPropertyUp=$property->select('','','','Position='.$iNewPos.' and RootId='.$aProperty[0]['RootId']);
					//update vi tri cho danh muc tim dc
					$property->update("Position='".$iOldPos."'","Id=".$aPropertyUp[0]['Id'].' and RootId='.$aProperty[0]['RootId']);
					//update vi tri co danh muc vua chon
					$property->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId='.$aProperty[0]['RootId']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end la danh muc con
			break;
		case 'delete':
				//xoa
				if($_GET['id'] !='')
				{
					//xoa tren bang productproperty
					$productproperty=new clsTable('productproperty');
					$productproperty->delete('propertyId='.$_GET['id']);
					//end xoa tren bang productproperty
					$property->delete('Id='.$_GET['id']);
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
					$property->update('Status='.$iStatus,'Id='.$_GET['id']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
			break;
	}

	//search
	if(isset($_POST['txtKeyword']) || isset($_GET['Key']))
	{
		$sKey=isset($_POST['txtKeyword']) ? $_POST['txtKeyword'] : $_GET['Key'];
		$sCondition=" and Name like '%".$sKey."%'";
		$sLink.="&Key=".$sKey;
	}
	else
		$sCondition="";
	//end search
	
	$aProperty=$property->select('','','','RootId=0'.$sCondition,'Position asc');
	$iLine=count($aProperty);
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
						$sDown='<a href="'.$sLink.'&id='.$aProperty[$i]['Id'].'&action=down&pos='.$aProperty[$i]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
					}
					else
						if($i < $iLine - 1)
						{
							$sUp='<a href="'.$sLink.'&id='.$aProperty[$i]['Id'].'&action=up&pos='.$aProperty[$i]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
							$sDown='<a href="'.$sLink.'&id='.$aProperty[$i]['Id'].'&action=down&pos='.$aProperty[$i]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
						}
						else
						{
							$sUp='<a href="'.$sLink.'&id='.$aProperty[$i]['Id'].'&action=up&pos='.$aProperty[$i]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
							$sDown='';
						}
				}	
				//end up/down
				
				//status	
				if($aProperty[$i]['Status']==1)
					$sLock='images/unlock.gif';
				else
					$sLock='images/lock.gif';
				//end status
				
				$aArray[$i]= array(
									'UP'=>$sUp,
									'DOWN'=>$sDown,
									'DETAIL'=>$aProperty[$i]['Detail'],
									'UNIT'=>$aProperty[$i]['Unit'],
									'VALUE'=>$aProperty[$i]['Value'],
									'STATUS'=>$aProperty[$i]['Status'] , 
									'ID'=>$aProperty[$i]['Id'] , 
									'NAME'=>$aProperty[$i]['Name'],
									'LOCK'=>$sLock
									);
				$list->assign('LISTPROPERTY',$aArray[$i]);
				
				//list child newscategory
				$aChild=$property->select('','','','RootId="'.$aProperty[$i]['Id'].'"','Position asc');
				$iChildLine=count($aChild);
				for($j=0 ; $j < $iChildLine ; $j++ )
				{
				
					//up/down
					if($iChildLine > 1)
					{
						if($j==0)
						{
							$sUp='';
							$sDown='<a href="'.$sLink.'&id='.$aChild[$j]['Id'].'&action=down&pos='.$aChild[$j]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
						}
						else
							if($j < $iChildLine - 1)
							{
								$sUp='<a href="'.$sLink.'&id='.$aChild[$j]['Id'].'&action=up&pos='.$aChild[$j]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
								$sDown='<a href="'.$sLink.'&id='.$aChild[$j]['Id'].'&action=down&pos='.$aChild[$j]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
							}
							else
							{
								$sUp='<a href="'.$sLink.'&id='.$aChild[$j]['Id'].'&action=up&pos='.$aChild[$j]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
								$sDown='';
							}	
					}
					else
					{
						$sUp='';
						$sDown='';
					}
					//end up/down
				
					if($aChild[$j]['Status']==1)
						$sLock='images/unlock.gif';
					else
						$sLock='images/lock.gif';
					
					$aChildArray=array(
									'UP'=>$sUp,
									'DOWN'=>$sDown,
									'DETAIL'=>$aChild[$j]['Detail'],
									'UNIT'=>$aChild[$j]['Unit'],
									'VALUE'=>$aChild[$j]['Value'],
									'STATUS'=>$aChild[$j]['Status'],
									'LOCK'=>$sLock,
									'ID'=>$aChild[$j]['Id'],
									'NAME'=>$aChild[$j]['Name']
									);
					$list->assign('LISTCHILDPROPERTY',$aChildArray);
					$list->parse('MAIN.LISTPROPERTY.LISTCHILDPROPERTY');
				}
				
				//end list child newscategory
				
				$list->parse('MAIN.LISTPROPERTY');
			}
		}
		$list->assign('PAGING',$paging);
	}
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>