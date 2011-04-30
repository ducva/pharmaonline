<?php	$oNews=new XTemplate('html/modules/news/news.tpl');
	
	include "components/news/news/toolbar.php";
	$oNews->assign('TOOLBAR',$sToolbar);
	
	$newscategory=new clsTable('newscategory');
	
	if(isset($_GET['catid']) && $_GET['catid'] != "")
	{
		$sCatCondition=' and Id='.$_GET['catid'];
	}
	else 
		$sCatCondition=' and RootId=0';
	
	$aNewsCategory=$newscategory->select('','','','Status=1'.$sCatCondition,'Position asc');
	$iLineNewsCategory=count($aNewsCategory);
	for($i=0 ; $i < $iLineNewsCategory ; $i++)
	{	
		$aNewsCategoryArray=array(
								'NAME'=>$aNewsCategory[$i]['Name']);
		$oNews->assign('NEWSCATEGORY',$aNewsCategoryArray);
		
		//neu danh muc chon la danh muc cha
		if($aNewsCategory[$i]['RootId']==0)
		{
			$aChildNewsCategory=$newscategory->select('','','','Status=1 and RootId='.$aNewsCategory[$i]['Id']);
			$iChildLine=count($aChildNewsCategory);
			$sListNewsCategoryId="";
			for($j=0 ; $j < $iChildLine ; $j++)
			{
				$sListNewsCategoryId.="'".$aChildNewsCategory[$j]['Id']."',";
			}
			$sCondition="Status=1 and (newscategoryId='".$aNewsCategory[$i]['Id']."' or newscategoryId IN (".$sListNewsCategoryId."''))";
		}
		//end danh muc cha
		else 	
			$sCondition="Status=1 and newscategoryId=".$aNewsCategory[$i]['Id'];
		$sLink='index.php?page=news&catid='.$aNewsCategory[$i]['Id'];
		$news=new clsTable('news');
		$aNews=$news->select('','','',$sCondition,'WriteDate desc');
		$iLineNews=count($aNews);
		if($iLineNews > 0 )
		{
			//phan trang
			$paging="";
			$maxRecord=(isset($_GET['catid']) ? 10 : 2);
			$CurPage="";
			if(isset($_GET['iPage']) && $_GET['iPage']!="")
			{
				$CurPage=$_GET['iPage'];
			}
			else $CurPage=1;
			$CurRecord=($CurPage-1)* $maxRecord+1;
			
			$TotalRecord=$iLineNews;
			if ($TotalRecord > 0)
			{
				$TotalPage=$TotalRecord / $maxRecord;
				if ($TotalRecord % $maxRecord !=0) $TotalPage +=1;
			
				if ($TotalRecord > $maxRecord)
				{
					$maxPage=5;
					$paging.="Trang: ";
					
					if($CurPage > 1) $paging.="<a href='".$sLink."&iPage=".($CurPage-1)."' class='lnkdirect1'>Trước</a>&nbsp;&nbsp;";
					if ($CurPage > $maxPage) $paging.="<a href='".$sLink."&iPage=1' class='lnkdirect1'>1</a>...";
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
							$paging.="<a href='".$sLink."&iPage=".$j."' class='lnkdirect1'>".$j."</a>&nbsp;&nbsp;";
						}
					}
					if ($CurPage < ((int)$TotalPage)-3) $paging.="... <a href='".$sLink."&iPage=".((int)$TotalPage)."' class='lnkdirect1'>".((int)$TotalPage)."</a>&nbsp;&nbsp;";
					if ($CurPage < $TotalPage-1) $paging.="<a href='".$sLink."&iPage=".($CurPage+1)."' class='lnkdirect1'>Sau</a>";
				
				}
				//end phan trang
				$iSPT=0;
				for($k=0 ; $k < $iLineNews ; $k++)
				{
					$iSPT++;
					if($iSPT>=$CurRecord && $iSPT<=$TotalRecord && $iSPT<=$CurPage*$maxRecord)
					{	
						$aNewsArray=array(
										'ID'=>$aNews[$k]['Id'],
										'TITLE'=>$aNews[$k]['Title'],
										'DESCRIPTION'=>$aNews[$k]['Description'],
										'IMAGE'=>$aNews[$k]['Image']
										);
						$oNews->assign('LISTNEWS',$aNewsArray);
						$oNews->parse('MAIN.NEWSCATEGORY.LISTNEWS');
					}
				}
				if(isset($_GET['catid']) && $_GET['catid'] != "")
					$oNews->assign('PAGING',$paging);
			}
		}
		else 	
			$oNews->parse('MAIN.NEWSCATEGORY.NONEWS');
			
		$oNews->parse('MAIN.NEWSCATEGORY');
	}
	
	$oNews->parse('MAIN');
	$HTMLContent=$oNews->text('MAIN');
?>