<?php	$product=new clsTable('product');
	$category=new clsTable('category');
	$sToolbar='<a href="./" class="lnkdirect1">Trang chủ</a>';
	
	$aCategory=$category->select('','','','Id='.$_GET['catid']);
	if($aCategory[0]['RootId']==0)
	{
		$sToolbar.=' &gt; <a href="index.php?page=product&catid='.$aCategory[0]['Id'].'" class="lnkdirect1">'.$aCategory[0]['Name'].'</a>';
	}
	else 
	{
		$aParentCategory=$category->select('','','','Id='.$aCategory[0]['RootId']);
		$sToolbar.=' &gt; <a href="index.php?page=product&catid='.$aParentCategory[0]['Id'].'"  class="lnkdirect1">'.$aParentCategory[0]['Name'].'</a> &gt; <a href="index.php?page=product&catid='.$aCategory[0]['Id'].'"  class="lnkdirect1">'.$aCategory[0]['Name'].'</a>';
	}
?>