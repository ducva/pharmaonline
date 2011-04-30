<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/rate/edit.tpl');
	
	$rate=new clsTable('rate');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Sửa')
	{
		$rate->update('Point = "'.$_POST['txtPoint'].'", Percent = "'.$_POST['txtPercent'].'"', 'Id = '.$_POST['txtId']);
		echo "<script>alert('Bạn đã sửa thành công!');window.location='?page=rate&do=edit';</script>";
	}
	elseif(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Xóa')
	{
		$rate->delete('Id = '.$_POST['txtId']);
		echo "<script>alert('Bạn đã xóa thành công!');window.location='?page=rate&do=edit';</script>";
	}
	else 
	{
		$aRate = $rate->select('', '', '', '', 'Point asc');
		if(count($aRate) > 0)
		{
			for($i = 0; $i < count($aRate); $i++)
			{
				$aRate[$i]['Number'] = $i + 1;
				$edit->assign('RATE', $aRate[$i]);
				$edit->parse('MAIN.RATE');
			}
		}
	}
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>