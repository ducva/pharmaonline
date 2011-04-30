<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/newscategory/edit.tpl');
	
	$newscategory=new clsTable('newscategory');
	$iNewsCategoryId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		
		$sName=$_POST['txtName'];
		$iRootId=$_POST['cboRootId'];
		$aNewsCategory=$newscategory->select("","","","Name ='$sName' and Id !=".$_GET['id']);
		if(count($aNewsCategory) > 0)
		{
			$sMessage="<script>alert('Tên danh mục này đã có trong hệ thống! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		
			$aNewsCategory=$newscategory->select("","","","Id=".$_GET['id']);
			if($iRootId != $aNewsCategory[0]['RootId'])
			{
			//get max position
				$aNewsCategory=$newscategory->select("","","","RootId='$iRootId'");
				$iLine=count($aNewsCategory);
				$iMaxPosition=0;
				for($i=0 ; $i < $iLine ; $i++)
				{
					if($iMaxPosition < $aNewsCategory[$i]['Position'] )
						$iMaxPosition=$aNewsCategory[$i]['Position'];
				}
				$iMaxPosition++;
				$sPosition=",Position='$iMaxPosition'";
			//end get max position
			}
			else
				$sPosition="";
			
			//them user
			$newscategory->update("Name='$sName'".$sPosition.",RootId='$iRootId'","Id=".$_GET['id']);
			//end them user
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=newscategory&do=edit&id=".$_GET['id']."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aNewsCategory=$newscategory->select('','','','Id='.$iNewsCategoryId);
	
	$edit->assign('NAME',$aNewsCategory[0]['Name']);
	
	$aParentNewsCategory=$newscategory->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aParentNewsCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aNewsCategory[0]['RootId'] == $aParentNewsCategory[$i]['Id'])
			$sSelected='selected';
		else
			$sSelected='';
			
		$aArray=array(
					'ID'=>$aParentNewsCategory[$i]['Id'],
					'NAME'=>$aParentNewsCategory[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('ROOTID',$aArray);
		$edit->parse('MAIN.ROOTID');
	}
		
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>