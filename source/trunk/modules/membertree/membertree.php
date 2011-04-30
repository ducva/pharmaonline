<?php	//init
	include "classdatabase/clsDatabase.php";
	include "classdatabase/clstable.php";
	include "include/publics.php";
	include "class/clsmember.php";
	$iId=$_GET['id'];
	$oMember=new clsMember($iId);
	$oMember->MakeTree();
?>