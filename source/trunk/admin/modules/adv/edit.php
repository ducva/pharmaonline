<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
	$edit = new XTemplate("html/modules/adv/edit.tpl");
	$advertising = new clsTable('advertising');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit'] == 'Đồng ý')
	{
		if($_FILES['txtAdvFile']['size'] && $_FILES['txtAdvFile']['size'] <= (1024*1024))
		{
			//del file
				$aDelAdv=$advertising->select('','','','Id = '.$_GET['id']);
				$sDir = ($aDelAdv[0]['Type'] == 1 ? 'images/' : 'flash/');
				$sFile = '../images/upload/adv/'.$sDir.$aDelAdv[0]['File'];
				if(is_file($sFile))
					unlink($sFile);
			//end del file
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
				
				
				$advertising->update('Name = "'.$_POST['txtAdvName'].'", Position = '.$_POST['cboAdvPosition'].', Type = '.$type.', Status = '.$_POST['radAdvStatus'].', Link = "'.$_POST['txtAdvLink'].'", File = "'.$_GET['id'].$sUpFile.'"', 'Id = '.$_GET['id']);
				move_uploaded_file($_FILES['txtAdvFile']['tmp_name'], '../images/upload/adv/'.$dir.'/'.$_GET['id'].$sUpFile);
				
				echo "<script>alert('Bạn đã thay đổi thành công thông tin quảng cáo vào CSDL'); window.location='?page=adv&do=list'; </script>";
					
			} 
			else
				echo '<script> alert("File không đúng định dạng");window.location="?page=adv&do=edit&id='.$_GET['id'].'";</script>';
		} 
		else 
		{
			$advertising->update('Name = "'.$_POST['txtAdvName'].'", Position = '.$_POST['cboAdvPosition'].', Status = '.$_POST['radAdvStatus'].', Link = "'.$_POST['txtAdvLink'].'"', 'Id = '.$_GET['id']); 
			echo "<script>alert('Không thay đổi ảnh, đã thay đổi thành công thông tin quảng cáo vào CSDL'); window.location='?mod=adv&page=listadv'; </script>";
		}
	}
	if(isset($_GET['id']) && $_GET['id'] != '')	
	{
		$aAdv = $advertising->select('', '', '', 'Id = '.$_GET['id']);
		
		if(substr($aAdv[0]['File'], -4, 4) == '.swf')
			$edit->assign('FILE', '<embed src="../images/upload/adv/flash/'.$aAdv[0]['File'].'" height="50"></embed>');
		else
			$edit->assign('FILE', '<img src="../images/upload/adv/images/'.$aAdv[0]['File'].'">');
		
		
		$aEditAdv = array('NAME' => $aAdv[0]['Name'], 'LINK' => $aAdv[0]['Link'], 'SELECTED'.$aAdv[0]['Position'] => 'selected', 'CHECKED'.$aAdv[0]['Status'] => 'checked');
		$edit->assign('MAIN', $aEditAdv);
	}
	$edit->parse('MAIN');
	$HTMLContent = $edit->text('MAIN');
?>