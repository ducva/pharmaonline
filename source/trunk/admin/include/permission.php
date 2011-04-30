<META http-equiv=Content-Type content="text/html; charset=utf-8">
<?php
/*************************************** 
*Nguoi viet : Nguyen Manh Hong.
*Chuc nang phan quyen.
****************************************/
	//$_SESSION['UserId']='1';//*****Demo
	$oPermissionDB = new clsTable('permission');
	if (isset($_GET['mod']))
	{
		$sMod = $_GET['mod'];
		$aPermission = $oPermissionDB->select('','module','F.moduleId=L.Id',"L.Notation='$sMod' and F.Level='1' and F.memberId='".$_SESSION['UserId']."'");
		if (count($aPermission)==0)
			echo "<script> alert('Bạn không có quyền quản trị module này'); window.location='index.php'</script>";
	}
?>
