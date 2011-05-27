<?php
	
	if(!$_SESSION['login'])
	{
		$_SESSION['login']="N" ;   
	}  
	if($_SESSION['login']=="N")
	{
		header("Location:login.php");
	}
?>