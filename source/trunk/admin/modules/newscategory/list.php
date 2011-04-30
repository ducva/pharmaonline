<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/newscategory/list.tpl');
	
	
	$sLink="?page=newscategory&do=list";
	if(isset($_GET['iPage']) && $_GET['iPage'] !="")
		$sPage='&iPage='.$_GET['iPage'];
	else 	
		$sPage="";
	$newscategory=new clsTable('newscategory');
	
	$sDo=$_GET['action'];
	switch($sDo)
	{
		case 'down':
				//neu la danh muc cha
				$aNewsCategory=$newscategory->select('','','','Id='.$_GET['id']);
				if($aNewsCategory[0]['RootId']==0)
				{
					$iOldPos=$_GET['pos'];
					$iNewPos=$_GET['pos'] + 1;
					//lay id cua danh muc phia duoi
					$aNewsCategoryDown=$newscategory->select('','','','Position='.$iNewPos.' and RootId=0');
					//update vi tri cho danh muc tim dc
					$newscategory->update("Position='".$iOldPos."'","Id=".$aNewsCategoryDown[0]['Id'].' and RootId=0');
					//update vi tri co danh muc vua chon
					$newscategory->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId=0');
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
					$aNewsCategoryDown=$newscategory->select('','','','Position='.$iNewPos.' and RootId='.$aNewsCategory[0]['RootId']);
					//update vi tri cho danh muc tim dc
					$newscategory->update("Position='".$iOldPos."'","Id=".$aNewsCategoryDown[0]['Id'].' and RootId='.$aNewsCategory[0]['RootId']);
					//update vi tri co danh muc vua chon
					$newscategory->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId='.$aNewsCategory[0]['RootId']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end la danh muc con
			break;
		case 'up':
				//neu la danh muc cha
				$aNewsCategory=$newscategory->select('','','','Id='.$_GET['id']);
				if($aNewsCategory[0]['RootId']==0)
				{
					$iOldPos=$_GET['pos'];
					$iNewPos=$_GET['pos'] - 1;
					//lay id cua danh muc phia duoi
					$aNewsCategoryUp=$newscategory->select('','','','Position='.$iNewPos.' and RootId=0');
					//update vi tri cho danh muc tim dc
					$newscategory->update("Position='".$iOldPos."'","Id=".$aNewsCategoryUp[0]['Id'].' and RootId=0');
					//update vi tri co danh muc vua chon
					$newscategory->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId=0');
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
					$aNewsCategoryUp=$newscategory->select('','','','Position='.$iNewPos.' and RootId='.$aNewsCategory[0]['RootId']);
					//update vi tri cho danh muc tim dc
					$newscategory->update("Position='".$iOldPos."'","Id=".$aNewsCategoryUp[0]['Id'].' and RootId='.$aNewsCategory[0]['RootId']);
					//update vi tri co danh muc vua chon
					$newscategory->update("Position='".$iNewPos."'","Id=".$_GET['id'].' and RootId='.$aNewsCategory[0]['RootId']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end la danh muc con
			break;
		case 'delete':
				//xoa
				if($_GET['id'] !='')
				{
					$newscategory->delete('Id='.$_GET['id']);
					$sMessage="<script>alert('Xóa thành công!');window.location='".$sLink."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
				//end xoa
			break;
		case 'status':
				$iStatus=($_GET['status'] <= 1) ? $_GET['status'] : 1;
				if($_GET['id'] !='')
				{
					$iStatus= 1 - $iStatus;
					$newscategory->update('Status='.$iStatus,'Id='.$_GET['id']);
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
	
	$aNewsCategory=$newscategory->select('','','','RootId=0'.$sCondition,'Position asc');
	$iLine=count($aNewsCategory);
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
				if($i==0)
				{
					$sUp='';
					$sDown='<a href="'.$sLink.'&id='.$aNewsCategory[$i]['Id'].'&action=down&pos='.$aNewsCategory[$i]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
				}
				else
					if($i < $iLine - 1)
					{
						$sUp='<a href="'.$sLink.'&id='.$aNewsCategory[$i]['Id'].'&action=up&pos='.$aNewsCategory[$i]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
						$sDown='<a href="'.$sLink.'&id='.$aNewsCategory[$i]['Id'].'&action=down&pos='.$aNewsCategory[$i]['Position'].$sPage.'"><img src="images/down.gif" border="0" title="Di chuyển xuống"></a>';
					}
					else
					{
						$sUp='<a href="'.$sLink.'&id='.$aNewsCategory[$i]['Id'].'&action=up&pos='.$aNewsCategory[$i]['Position'].$sPage.'"><img src="images/up.gif" border="0" title="Di chuyển lên"></a>';
						$sDown='';
					}	
				//end up/down
				
				//status	
				if($aNewsCategory[$i]['Status']==1)
					$sLock='images/unlock.gif';
				else
					$sLock='images/lock.gif';
				//end status
				
				$aArray[$i]= array(
									'UP'=>$sUp,
									'DOWN'=>$sDown,
									'STATUS'=>$aNewsCategory[$i]['Status'] , 
									'ID'=>$aNewsCategory[$i]['Id'] , 
									'NAME'=>$aNewsCategory[$i]['Name'],
									'LOCK'=>$sLock
									);
				$list->assign('LISTNEWSCATEGORY',$aArray[$i]);
				
				//list child newscategory
				$aChild=$newscategory->select('','','','RootId="'.$aNewsCategory[$i]['Id'].'"','Position asc');
				$iChildLine=count($aChild);
				for($j=0 ; $j < $iChildLine ; $j++ )
				{
				
					//total
					$news=new clsTable('news');
					$aNews=$news->select('','','','newscategoryId='.$aChild[$j]['Id']);
					$iTotal=count($aNews);
					//end total
				
					//up/down
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
					//end up/down
				
					if($aChild[$j]['Status']==1)
						$sLock='images/unlock.gif';
					else
						$sLock='images/lock.gif';
					
					$aChildArray=array(
									'UP'=>$sUp,
									'DOWN'=>$sDown,
									'STATUS'=>$aChild[$j]['Status'],
									'LOCK'=>$sLock,
									'ID'=>$aChild[$j]['Id'],
									'NAME'=>$aChild[$j]['Name'],
									'TOTAL'=>$iTotal
									);
					$list->assign('LISTCHILDNEWSCATEGORY',$aChildArray);
					$list->parse('MAIN.LISTNEWSCATEGORY.LISTCHILDNEWSCATEGORY');
				}
				
				//end list child newscategory
				
				$list->parse('MAIN.LISTNEWSCATEGORY');
			}
		}
		$list->assign('PAGING',$paging);
	}
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>