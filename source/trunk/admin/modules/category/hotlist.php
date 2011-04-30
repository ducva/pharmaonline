<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$hotlist=new XTemplate('html/modules/category/hotlist.tpl');
	
	$oCategory=new clsTable('category');	
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		if(!empty($_POST['chkCategoryId']))
		{
			$sStringId="";
			while(list($key,$value)=each($_POST['chkCategoryId']))
			{
				$sStringId.=$value.",";
			}
			$sStringId=str_replace(",","','",$sStringId);
			
			$oCategory->update("HotCategory=1","Id IN ('".$sStringId."')");
			$oCategory->update("HotCategory=0","Id NOT IN ('".$sStringId."')");
		}
		$sMessage='<script>alert("Cập nhật thành công");window.location="index.php?page=category&do=hotlist";</script>';
		$hotlist->assign('MESSAGE',$sMessage);
		
	}
	
	$aCategory=$oCategory->select('','','','RootId=0','Position asc');
	$iSTT=0;
	for($i=0 ; $i < count($aCategory) ; $i++)
	{
		$iSTT++;
		if($aCategory[$i]['HotCategory']==1)
			$sChecked='checked';
		else
		$sChecked='';
		$aArray=array(
					'ID'=>$aCategory[$i]['Id'],
					'NAME'=>$aCategory[$i]['Name'],
					'CHECKED'=>$sChecked
					);
		$hotlist->assign('HOTLISTCOL',$aArray);
		$hotlist->parse('MAIN.HOTLISTROW.HOTLISTCOL');	
		if($iSTT % 4 == 0)
		{
			$hotlist->parse('MAIN.HOTLISTROW');				
		}
	}
	$hotlist->parse('MAIN.HOTLISTROW');	
	$hotlist->parse('MAIN');
	$HTMLContent=$hotlist->text('MAIN');	
?>