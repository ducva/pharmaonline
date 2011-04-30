<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/rate/add.tpl');
	
	$rate=new clsTable('rate');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$rate->insert('Point, Percent', '"'.$_POST['txtPoint'].'", "'.$_POST['txtPercent'].'"');
		echo "<script>alert('Bạn đã thêm thành công mức điểm mới vào hệ thống');window.location='?page=rate&do=add';</script>";
	}
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>