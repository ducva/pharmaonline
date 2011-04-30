<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
	$add = new XTemplate("html/modules/adv/add.tpl");
	$advertising = new clsTable('advertising');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit'] == 'Đồng ý')
	{
		if($_FILES['txtAdvFile']['size'] && $_FILES['txtAdvFile']['size'] <= (1024*1024))
		{
			$sUpFile = $_FILES['txtAdvFile']['name'];
			$sUpFile = substr($sUpFile, -4, 4);
			if(($_FILES['txtAdvFile']['type'] == 'image/gif' || $_FILES['txtAdvFile']['type'] == 'image/pjpeg' || $_FILES['txtAdvFile']['type'] == 'image/x-png' || $_FILES['txtAdvFile']['type'] == 'application/x-shockwave-flash') && ($sUpFile == '.gif' || $sUpFile == '.jpg' || $sUpFile == '.png' || $sUpFile == '.swf'))
			{
				if($_FILES['txtAdvFile']['type'] == 'image/gif' || $_FILES['txtAdvFile']['type'] == 'image/pjpeg' || $_FILES['txtAdvFile']['type'] == 'image/x-png')
				{
					$dir = 'images';
					$type = 1;
				} 
				elseif($_FILES['txtAdvFile']['type'] == 'application/x-shockwave-flash')
				{
					$dir = 'flash';
					$type = 2;
				}
				
				
				$aAdv = $advertising->select('', '', '', 'Position = '.$_POST['cboAdvPosition'], 'Priority desc');
				$advertising->insert('Name, Position, Priority, Type, Status, Link', '"'.$_POST['txtAdvName'].'", "'.$_POST['cboAdvPosition'].'", "'.($aAdv[0]['Priority'] + 1).'", "'.$type.'", "'.$_POST['radAdvStatus'].'", "'.$_POST['txtAdvLink'].'"');
				$advertising->update('File = "'.$advertising->iInsertId.$sUpFile.'"', 'Id = '.$advertising->iInsertId);
				move_uploaded_file($_FILES['txtAdvFile']['tmp_name'], '../images/upload/adv/'.$dir.'/'.$advertising->iInsertId.$sUpFile);
				
				echo "<script>alert('Bạn đã thêm thành công quảng cáo mới vào CSDL');window.location='?page=adv&do=add';</script>";
					
			} 
			else
				echo '<script> alert("File không đúng định dạng");window.location="?page=adv&do=add";</script>';
		} else 
			echo '<script> alert("File không tồn tại hoặc lớn hơn 1MB");window.location="?page=adv&do=add";</script>';
	}
	if(isset($_GET['position']) && $_GET['position'] != '')	
	{
		$add->assign('SELECTED'.$_GET['position'], 'selected');
	}
	$add->parse('MAIN');
	$HTMLContent = $add->text('MAIN');
?>