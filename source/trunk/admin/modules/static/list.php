<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/static/list.tpl');
	
	$sLink="?page=static&do=list";
	$news=new clsTable('content');
	if(isset($_GET['iPage']) && $_GET['iPage'] !="")
		$sPage='&iPage='.$_GET['iPage'];
	else 	
		$sPage="";
	
	$sDo=$_GET['action'];
	switch($sDo)
	{
		case 'delete':
				//xoa
				if($_GET['id'] !='')
				{
					//delete image
					$aNews=$news->select('','','','Id='.$_GET['id']);
					$sThumbImage='../images/upload/news/thumbs/'.$aNews[0]['Image'];
					$sImage='../images/upload/news/'.$aNews[0]['Image'];
					if(is_file($sThumbImage))
						unlink($sThumbImage);
					if(is_file($sImage))
						unlink($sImage);
					//end delete image
					$news->delete('Id='.$_GET['id']);
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
					$news->update('Status='.$iStatus,'Id='.$_GET['id']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
			break;
	}
	
	//search
	if(isset($_POST['txtKeyword']) || isset($_GET['Key']))
	{
		$sKey=isset($_POST['txtKeyword']) ? $_POST['txtKeyword'] : $_GET['Key'];
		$sCondition="F.Title like '%".$sKey."%' or F.Description like '%".$sKey."%' or F.Detail like '%".$sKey."%'";
		$sLink.="&Key=".$sKey;
	}
	else
		$sCondition="";
	//end search
	
	$aNews=$news->select('F.*',$sCondition,'id desc');
	$iLine=count($aNews);

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
				//status
				if($aNews[$i]['Status']==1)
					$sLock="images/unlock.gif";
				else
					$sLock="images/lock.gif";
				//end status
							
				$aArray[$i]= array(
									'ID'=>$aNews[$i]['Id'] , 
									'NAME'=>$aNews[$i]['Name'] , 
									'CONTENT'=>$aNews[$i]['Content'],
									'POSITION'=>$aNews[$i]['Position'],
									'STATUS'=>$aNews[$i]['status'],
									);
				$list->assign('LISTCONTENTS',$aArray[$i]);
				$list->parse('MAIN.LISTCONTENTS');
			}
		}
		$list->assign('PAGING',$paging);
	}
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>