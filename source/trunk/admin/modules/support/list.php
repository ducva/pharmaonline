<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/support/list.tpl');
	
	
	$sLink="?page=support&do=list";
	$admin=new clsTable('supporter');
	
	//xoa
	if(isset($_GET['action']) && $_GET['action']=='delete' && $_GET['id'] !='')
	{
		$admin->delete('Id='.$_GET['id']);
		$sMessage="<script>alert('Xóa thành công!');window.location='".$sLink."';</script>";
		$list->assign('MESSAGE',$sMessage);
	}
	//end xoa
	
	if(isset($_GET['iPage']) && $_GET['iPage'] !="")
		$sPage='&iPage='.$_GET['iPage'];
	else 	
		$sPage="";
	
	
	//search
	if(isset($_POST['txtKeyword']) || isset($_GET['Key']))
	{
		$sKey=isset($_POST['txtKeyword']) ? $_POST['txtKeyword'] : $_GET['Key'];
		$sCondition="name like '%".$sKey."%'";
		$sLink.="&Key=".$sKey;
	}
	else
		$sCondition="";
	//end search
	
	$aAdmin=$admin->select('id, name, skype, yahoo, mobile, title, status','','',$sCondition);
	$iLine=count($aAdmin);
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
		//new dBug($aAdmin);
		for($i=0;$i<$iLine;$i++)
		{
			$stt++;
			if($stt>=$CurRecord && $stt<=$TotalRecord && $stt<=$CurPage*$maxRecord)
			{	
				$status_text = ($aAdmin[$i]['status'])?('Đang sử dụng'):('Không sử dụng');
				$aArray[$i]= array(
									'ID'=>$aAdmin[$i]['id'] , 
									'NAME'=>$aAdmin[$i]['name'],
									'SKYPE'=>$aAdmin[$i]['skype'],
									'YAHOO'=>$aAdmin[$i]['yahoo'],
									'MOBILE'=>$aAdmin[$i]['mobile'],
									'STATUS'=>$status_text,
									'TITLE'=>$aAdmin[$i]['title'],
									);
				$list->assign('LISTADMIN',$aArray[$i]);
				$list->parse('MAIN.LISTADMIN');
			}
		}
		$list->assign('PAGING',$paging);
	}
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>