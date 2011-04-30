<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/category/edit.tpl');
	
	$category=new clsTable('category');
	$iCategoryId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua category
		$sName=$_POST['txtName'];
		$iRootId=$_POST['cboRootId'];
		$aCategory=$category->select("","","","Name ='$sName' and Id !=".$_GET['id']);
		if(count($aCategory) > 0)
		{
			$sMessage="<script>alert('Tên danh mục này đã có trong hệ thống! Xin bạn chọn tên khác');history.go(-1);</script>";	
		}
		else 
		{
		//end kiem tra su ton tai cua category
		
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
		
			$aCategory=$category->select("","","","Id=".$_GET['id']);
			if($iRootId != $aCategory[0]['RootId'])
			{
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
				$sPosition=",Position='$iMaxPosition'";
			//end get max position
			}
			else
				$sPosition="";
			
			//them user
			$category->update("Name='$sName',ListPropertyId='$sListPropertyId'".$sPosition.",RootId='$iRootId'","Id=".$_GET['id']);
			//end them user
			
			$sMessage="<script>alert('Cập nhật thành công');window.location='?page=category&do=edit&id=".$_GET['id']."';</script>";
		}
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aCategory=$category->select('','','','Id='.$iCategoryId);
	
	$edit->assign('NAME',$aCategory[0]['Name']);
	
	//aListPropertyId
	$aListPropertyId=explode(',',$aCategory[0]['ListPropertyId']);
	//number propertyId
	$iNumberProperty=count($aListPropertyId);
	
	$aParentCategory=$category->select('','','','RootId=0  and Status=1','Position asc');
	$iLine=count($aParentCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aCategory[0]['RootId'] == $aParentCategory[$i]['Id'])
			$sSelected='selected';
		else
			$sSelected='';
			
		$aArray=array(
					'ID'=>$aParentCategory[$i]['Id'],
					'NAME'=>$aParentCategory[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('ROOTID',$aArray);
		$edit->parse('MAIN.ROOTID');
	}
	
	//property
	$property=new clsTable('property');
	$aParentProperty=$property->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aParentProperty);
	for($i=0 ; $i < $iLine ; $i++)
	{
		//kiem tra danh muc co property nay khong ?
		for($x=0 ; $x < $iNumberProperty ; $x++)
		{
			if($aParentProperty[$i]['Id']==$aListPropertyId[$x])
			{
				$sChecked='checked';
				break;
			}
			else
				$sChecked='';
		}
		//end kiem tra
		
		$aArray=array(
					'ID'=>$aParentProperty[$i]['Id'],
					'NAME'=>$aParentProperty[$i]['Name'],
					'CHECKED'=>$sChecked
					);
		$edit->assign('LISTPROPERTY',$aArray);
		
		//child property
		$aChildProperty=$property->select('','','','Status=1 and RootId='.$aParentProperty[$i]['Id'],'Position asc');
		$iChildLine=count($aChildProperty);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
		
			//kiem tra danh muc co property nay khong ?
			for($x=0 ; $x < $iNumberProperty ; $x++)
			{
				if($aChildProperty[$j]['Id']==$aListPropertyId[$x])
				{
					$sChecked='checked';
					break;
				}
				else
					$sChecked='';
			}
			//end kiem tra
		
			$aArray=array(
					'ID'=>$aChildProperty[$j]['Id'],
					'NAME'=>$aChildProperty[$j]['Name'],
					'UNIT'=>$aChildProperty[$j]['Unit'],
					'CHECKED'=>$sChecked
					);
			$edit->assign('LISTCHILDPROPERTY',$aArray);
			$edit->parse('MAIN.LISTPROPERTY.LISTCHILDPROPERTY');
		}
		//end child property
		
		$edit->parse('MAIN.LISTPROPERTY');
	}
	//edn property
		
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>