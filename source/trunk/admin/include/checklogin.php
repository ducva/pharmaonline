<?php
	if(!session_is_registered('login'))
	{
		$_SESSION['login']="N" ;   
	}  
	if($_SESSION['login']=="N")
	{
		header("Location:login.php");
	}
?>