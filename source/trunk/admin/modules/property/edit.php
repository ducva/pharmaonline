<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/property/edit.tpl');
	
	$property=new clsTable('property');
	$iPropertyId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$sName=$_POST['txtName'];
		$iRootId=$_POST['cboPropertyId'];
		$aProperty=$property->select("","","","Id=".$_GET['id']);
		
		if($iRootId != $aProperty[0]['RootId'])
		{
		//get max position
			$aProperty=$property->select("","","","RootId='$iRootId'");
			$iLine=count($aProperty);
			$iMaxPosition=0;
			for($i=0 ; $i < $iLine ; $i++)
			{
				if($iMaxPosition < $aProperty[$i]['Position'] )
					$iMaxPosition=$aProperty[$i]['Position'];
			}
			$iMaxPosition++;
			$sPosition=",Position='$iMaxPosition'";
		//end get max position
		}
		else
			$sPosition="";
		
		$sDetail=$_POST['txtDetail'];
		$sUnit=$_POST['txtUnit'];
		$sValue=$_POST['txtValue'];
		
		$property->update("Name='$sName'".$sPosition.",Detail='$sDetail',Unit='$sUnit',Value='$sValue',RootId='$iRootId'","Id=".$_GET['id']);
				
		$sMessage="<script>alert('Cập nhật thành công');window.location='?page=property&do=edit&id=".$iPropertyId."';</script>";
		
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aProperty=$property->select("","","","Id='$iPropertyId'");
	
	//cboPropertyId
	$aCboPropertyId=$property->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aCboPropertyId);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aCboPropertyId[$i]['Id'] == $aProperty[0]['RootId'])
			$sSelected='selected';
		else
			$sSelected='';
		$aArray=array(
					'ID'=>$aCboPropertyId[$i]['Id'],
					'NAME'=>$aCboPropertyId[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('PROPERTY',$aArray);
		$edit->parse('MAIN.PROPERTY');
	}
	//end cboNewsCategory
	$edit->assign('NAME',$aProperty[0]['Name']);
	$edit->assign('DETAIL',$aProperty[0]['Detail']);
	$edit->assign('UNIT',$aProperty[0]['Unit']);
	$edit->assign('VALUE',$aProperty[0]['Value']);
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>