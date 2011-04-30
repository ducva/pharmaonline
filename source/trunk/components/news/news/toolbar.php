<?php	$newscategory=new clsTable('newscategory');
	$sToolbar='<a href="./" class="lnkdirect1">Trang chủ</a> &gt; <a href="index.php?page=news" class="lnkdirect1">Tin tức</a>';
	
	if((isset($_GET['catid']) && $_GET['catid'] !='') || isset($_GET['newsid']) && $_GET['newsid'] != '')
	{
		if(isset($_GET['newsid']))
		{
			$new=new clsTable('news');
			$aNews=$new->select('','','','Id='.$_GET['newsid']);
			$_GET['catid']=$aNews[0]['newscategoryId'];
		}
		
		$aNewsCategory=$newscategory->select('','','','Id='.$_GET['catid']);
		if($aNewsCategory[0]['RootId']==0)
		{
			$sToolbar.=' &gt; <a href="index.php?page=news&catid='.$aNewsCategory[0]['Id'].'" class="lnkdirect1">'.$aNewsCategory[0]['Name'].'</a>';
		}
		else 
		{
			$aParentNewsCategory=$newscategory->select('','','','Id='.$aNewsCategory[0]['RootId']);
			$sToolbar.=' &gt; <a href="index.php?page=news&catid='.$aParentNewsCategory[0]['Id'].'"  class="lnkdirect1">'.$aParentNewsCategory[0]['Name'].'</a> &gt; <a href="index.php?page=news&catid='.$aNewsCategory[0]['Id'].'"  class="lnkdirect1">'.$aNewsCategory[0]['Name'].'</a>';
		}
	}
?>