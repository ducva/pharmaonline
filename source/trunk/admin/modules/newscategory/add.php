<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/newscategory/add.tpl');
	
	$newscategory=new clsTable('newscategory');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$sName=$_POST['txtName'];
		$iRootId=$_POST['cboRootId'];
		$aNewsCategory=$newscategory->select("","","","Name ='$sName'");
		if(count($aNewsCategory) > 0)
		{
			$sMessage="<script>alert('Tên danh mục này đã có trong hệ thống! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua user
			
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
			//end get max position
			//them user
			$newscategory->insert("Name,Position,RootId","'$sName','$iMaxPosition','$iRootId'");
			//end them user
			
			$sMessage="<script>alert('Bạn đã thêm thành công danh mục tin tức mới vào hệ thống');window.location='?page=newscategory&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$aParentNewsCategory=$newscategory->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aParentNewsCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aParentNewsCategory[$i]['Id'],
					'NAME'=>$aParentNewsCategory[$i]['Name']					
					);
		$add->assign('ROOTID',$aArray);
		$add->parse('MAIN.ROOTID');
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>