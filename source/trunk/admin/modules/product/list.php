<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$list=new XTemplate('html/modules/product/list.tpl');
	
	$sLink="?page=product&do=list";
	$product=new clsTable('product');
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
					$productproperty=new clsTable('productproperty');
					$productproperty->delete('productId='.$_GET['id']);
					//delete image
					$aProduct=$product->select('','','','Id='.$_GET['id']);
					$sThumbImage='../images/upload/product/thumbs/'.$aProduct[0]['Image'];
					$sImage='../images/upload/product/'.$aProduct[0]['Image'];
					if(is_file($sThumbImage))
						unlink($sThumbImage);
					if(is_file($sImage))
						unlink($sImage);
					//end delete image
					$product->delete('Id='.$_GET['id']);
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
					$product->update('Status='.$iStatus,'Id='.$_GET['id']);
					$sMessage="<script>window.location='".$sLink.$sPage."';</script>";
					$list->assign('MESSAGE',$sMessage);
				}
			break;
	}
	
	
	//cboCategory
	$category= new clsTable('category');
	$aCategory=$category->select('','','','RootId=0','Position asc');
	$iLine=count($aCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aCategory[$i]['Id']==$_GET['catid'])
			$sSelected='selected';
		else
			$sSelected='';
		$aArray=array(
					'ID'=>$aCategory[$i]['Id'],
					'NAME'=>$aCategory[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$list->assign('CATEGORY',$aArray);
		//cboChildCategory
		$aChildCategory=$category->select('','','','RootId='.$aCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildCategory);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			if($aChildCategory[$j]['Id']==$_GET['catid'])
				$sSelected='selected';
			else
				$sSelected='';
			$aArray=array(
					'ID'=>$aChildCategory[$j]['Id'],
					'NAME'=>$aChildCategory[$j]['Name'],
					'SELECTED'=>$sSelected
					);
			$list->assign('CHILDCATEGORY',$aArray);
			$list->parse('MAIN.CATEGORY.CHILDCATEGORY');
		}
		//end cboChildCategory
		$list->parse('MAIN.CATEGORY');
	}
	//end cboCategory
	
	//search
	if(isset($_GET['Key']))
	{
		$sKey=$_GET['Key'];
		$sKeyword=" and (F.Name like '%".$sKey."%' or F.Description like '%".$sKey."%' or F.Detail like '%".$sKey."%')";
		$sLink.="&Key=".$sKey;
	}
	else
		$sKeyword="";
		
	if($_GET['catid'] !=0 && $_GET['catid'] !="")
	{
		$iCategoryId=$_GET['catid'];
		//neu danh muc chon la danh muc cha
		$aCategory=$category->select('','','','Id='.$iCategoryId);
		if($aCategory[0]['RootId']==0)
		{
			$aChildCategory=$category->select('','','','RootId='.$iCategoryId);
			$iLine=count($aChildCategory);
			$sListCategoryId="";
			for($i=0 ; $i < $iLine ; $i++)
			{
				$sListCategoryId.="'".$aChildCategory[$i]['Id']."',";
			}
			$sCondition="F.Status !=2 and (F.categoryId IN (".$sListCategoryId."'') or F.categoryId=".$iCategoryId.") ".$sKeyword;
		}
		//end danh muc cha
		else 
		{
			$sCondition="F.categoryId=".$iCategoryId.$sKeyword;
		}
		$sLink.="&catid=".$iCategoryId;
	}
	else
		$sCondition="F.Status != 2 ".$sKeyword;
	//end search
	
	$aProduct=$product->select('F.Views as PView,F.Status as PStatus,F.Id as PId,F.Code as PCode,F.Name as PName,F.Detail as Detail,F.Description as Description,F.Image as PImage,L.Name as CName,date_format(F.CreateDate,"%d-%m-%Y") as PCreateDate','category','F.categoryId=L.Id',$sCondition,'F.Id asc');
	$iLine=count($aProduct);

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
				if($aProduct[$i]['PStatus']==1)
					$sLock="images/unlock.gif";
				else
					$sLock="images/lock.gif";
				//end status
							
				$aArray[$i]= array(
									'CODE'=>$aProduct[$i]['PCode'] ,
									'ID'=>$aProduct[$i]['PId'] , 
									'NAME'=>$aProduct[$i]['PName'] , 
									'VIEW'=>$aProduct[$i]['PView'],
									'IMAGE'=>'../images/upload/product/thumbs/'.$aProduct[$i]['PImage'],
									'CREATEDATE'=>$aProduct[$i]['PCreateDate'],
									'CATEGORY'=>$aProduct[$i]['CName'],
									'STATUS'=>$aProduct[$i]['PStatus'],
									'LOCK'=>$sLock );
				$list->assign('LISTPRODUCT',$aArray[$i]);
				$list->parse('MAIN.LISTPRODUCT');
			}
		}
		$list->assign('PAGING',$paging);
	}
	$list->parse('MAIN');
	$HTMLContent=$list->text('MAIN');	
?>