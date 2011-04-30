<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/unit/list.tpl');
	
	$sLink="?page=unit&do=list";
	$unit=new clsTable('unit');
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
					$unit->delete('Id='.$_GET['id']);
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
					$unit->update('Status='.$iStatus,'Id='.$_GET['id']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
			break;
	}
	
	//search
	if(isset($_POST['txtKeyword']) || isset($_GET['Key']))
	{
		$sKey=isset($_POST['txtKeyword']) ? $_POST['txtKeyword'] : $_GET['Key'];
		$sCondition="Name like '%".$sKey."%'";
		$sLink.="&Key=".$sKey;
	}
	else
		$sCondition="";
	//end search
	
	$aUnit=$unit->select('','','',$sCondition,'Position asc');
	$iLine=count($aUnit);

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
				if($i==0)
				{
					$sUp="images/space.gif";
					$sDown="images/down.gif";
				}
				else
					if($i==$iLine-1)
					{
						$sUp="images/up.gif";
						$sDown="images/space.gif";
					}
					else
					{
						$sUp="images/up.gif";
						$sDown="images/down.gif";
					}
				//status
				if($aUnit[$i]['Status']==1)
					$sLock="images/unlock.gif";
				else
					$sLock="images/lock.gif";
				//end status
			
				$aArray[$i]= array(
									'ID'=>$aUnit[$i]['Id'] , 
									'NAME'=>$aUnit[$i]['Name'] , 
									'INFO'=>$aUnit[$i]['Info'],
									'STATUS'=>$aUnit[$i]['Status'],
									'LOCK'=>$sLock );
				$list->assign('LISTUNIT',$aArray[$i]);
				$list->parse('MAIN.LISTUNIT');
			}
		}
		$list->assign('PAGING',$paging);
	}
	
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>