<?php	$product=new clsTable('product');
	$category=new clsTable('category');
	$sToolbar='<a href="./" class="lnkdirect1">Trang chủ</a>';
	$aProduct=$product->select('','','','Id='.$_GET['proid']);
	$aCategory=$category->select('','','','Id='.$aProduct[0][categoryId]);
	if($aCategory[0]['RootId']==0)
	{
		$sToolbar.=' &gt; <a href="index.php?page=product&catid='.$aCategory[0]['Id'].'" class="lnkdirect1">'.$aCategory[0]['Name'].'</a> &gt; '.$aProduct[0]['Name'];
	}
	else 
	{
		$aParentCategory=$category->select('','','','Id='.$aCategory[0]['RootId']);
		$sToolbar.=' &gt; <a href="index.php?page=product&catid='.$aParentCategory[0]['Id'].'"  class="lnkdirect1">'.$aParentCategory[0]['Name'].'</a> &gt; <a href="index.php?page=product&catid='.$aCategory[0]['Id'].'"  class="lnkdirect1">'.$aCategory[0]['Name'].'</a>';
	}
?>