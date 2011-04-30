<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/category/add.tpl');
	
	$category=new clsTable('category');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai
		$sName=$_POST['txtName'];
		$iRootId=$_POST['cboRootId'];
		$aCategory=$category->select("","","","Name ='$sName'");
		if(count($aCategory) > 0)
		{
			$sMessage="<script>alert('Tên danh mục này đã có trong hệ thống! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai
			
			//list property
			if(is_array($_POST['chkProperty']))
			{
				$sListPropertyId="";
				while(list($key,$value) = each($_POST['chkProperty']))
				{
					$sListPropertyId.=$value.',';
				}
			}
			//end list property
			
			//get max position
			$aCategory=$category->select("","","","RootId='$iRootId'");
			$iLine=count($aCategory);
			$iMaxPosition=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				if($iMaxPosition < $aCategory[$i]['Position'] )
					$iMaxPosition=$aCategory[$i]['Position'];
			}
			$iMaxPosition++;
			//end get max position
			//them user
			$category->insert("Name,Position,RootId,ListPropertyId","'$sName','$iMaxPosition','$iRootId','$sListPropertyId'");
			//end them user
			
			$sMessage="<script>alert('Bạn đã thêm thành công danh mục sản phẩm mới vào hệ thống');window.location='?page=category&do=add';</script>";
		}
		$add->assign('MESSAGE',$sMessage);
	}
	
	$aParentCategory=$category->select('','','','RootId=0','Position asc');
	$iLine=count($aParentCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aParentCategory[$i]['Id'],
					'NAME'=>$aParentCategory[$i]['Name']					
					);
		$add->assign('ROOTID',$aArray);
		$add->parse('MAIN.ROOTID');
	}
	
	//property
	$property=new clsTable('property');
	$aParentProperty=$property->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aParentProperty);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aParentProperty[$i]['Id'],
					'NAME'=>$aParentProperty[$i]['Name']
					);
		$add->assign('LISTPROPERTY',$aArray);
		
		//child property
		$aChildProperty=$property->select('','','','Status=1 and RootId='.$aParentProperty[$i]['Id'],'Position asc');
		$iChildLine=count($aChildProperty);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			$aArray=array(
					'ID'=>$aChildProperty[$j]['Id'],
					'NAME'=>$aChildProperty[$j]['Name'],
					'UNIT'=>$aChildProperty[$j]['Unit']
					);
			$add->assign('LISTCHILDPROPERTY',$aArray);
			$add->parse('MAIN.LISTPROPERTY.LISTCHILDPROPERTY');
		}
		//end child property
		
		$add->parse('MAIN.LISTPROPERTY');
	}
	//edn property
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>