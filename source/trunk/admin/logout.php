<?php	@session_start();
	unset($_SESSION['Username']);
	unset($_SESSION['UserId']);
	$_SESSION['login']="N";
	$sMessage='<meta http-equiv=refresh content="0;URL=login.php">';
	echo $sMessage;
?>