<?php
	
	include "include/checklogin.php";
	
	//init
	include "../classdatabase/clsDatabase.php";
	include "../classdatabase/clstable.php";
	include "../include/publics.php";
	include "../class/clsadv.php";
	include "../class/clspaging.php";
	include "../class/clsmember.php";
	include "../class/clsmethod.php";
	include "../class/clsorders.php";
	$_SESSION['Date']=date('m-Y');
	$aFolderName=array(
					'member'=>'member',
					'admin'=>'admin',
					'newscategory'=>'newscategory',
					'news'=>'news',
					'provider'=>'provider',
					'manufacturer'=>'manufacturer',
					'category'=>'category',
					'property'=>'property',
					'unit'=>'unit',
					'currency'=>'currency',
					'product'=>'product',
					'ajax'=>'ajax',
					'intro'=>'intro',
					'service'=>'service',
					'rules'=>'rules',
					'adv'=>'adv',
					'orders'=>'orders',
					'config'=>'config',
					'rate'=>'rate'
					);
	//end init
	include "include/xtpl.php";
	$xtpl=new XTemplate('html/index.tpl');
	
	//toolbar
	include "components/toolbar.php";
	$xtpl->assign('TOOLBAR',$HTMLToolbar);
	
	//content
	if(!isset($_GET['page']) || $_GET['page']=="")
	{
		include "components/home.php";
		$xtpl->assign('CONTENT',$HTMLHome);
	}
	else
	{
		$page="modules/".$aFolderName[$_GET['page']]."/".$_GET['do'].".php";
		include "$page";
		$xtpl->assign('CONTENT',$HTMLContent);
	}
	//end content
	
	$xtpl->parse('MAIN');
	$xtpl->out('MAIN');
?>