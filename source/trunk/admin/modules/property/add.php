<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/property/add.tpl');
	
	$property=new clsTable('property');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//get max position
		$iRootId=$_POST['cboPropertyId'];
		$aProperty=$property->select("","","","RootId='$iRootId'");
		$iLine=count($aProperty);
		$iMaxPosition=0;
		for($i=0 ; $i < $iLine ; $i++)
		{
			if($iMaxPosition < $aProperty[$i]['Position'] )
				$iMaxPosition=$aProperty[$i]['Position'];
		}
		$iMaxPosition++;
		//end get max position
		$sName=$_POST['txtName'];
		$sDetail=$_POST['txtDetail'];
		$sUnit=$_POST['txtUnit'];
		$sValue=$_POST['txtValue'];
		//them property
		$property->insert("Name,Position,Detail,Unit,Value,RootId","'$sName','$iMaxPosition','$sDetail','$sUnit','$sValue','$iRootId'");
		//end them property
		
		$sMessage="<script>alert('Bạn đã thêm thành công thuộc tính mới vào hệ thống');window.location='?page=property&do=add';</script>";
		$add->assign('MESSAGE',$sMessage);
	}
	
	//cboproperty
	$property= new clsTable('property');
	$aProperty=$property->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aProperty);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aProperty[$i]['Id'],
					'NAME'=>$aProperty[$i]['Name']
					);
		$add->assign('PROPERTY',$aArray);
		$add->parse('MAIN.PROPERTY');
	}
	//end cboproperty
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>