<?php
	
	//include "include/checklogin.php";
	require("include/function.php");
	require "include/classcart.php";
	
	//init
	include "classdatabase/clsDatabase.php";
	include "classdatabase/clstable.php";
	include "include/publics.php";
	include "class/clsadv.php";
	include "class/clsmember.php";
	include "class/clsmethod.php";
	include "class/clsorders.php";
	include "class/clsuseronline.php";
	//end init
	include "include/xtpl.php";
	$xtpl=new XTemplate('html/index.tpl');
	
	//loadmenu
	$category=new clsTable('category');
	$aParentCategory=$category->select('','','','RootId=0 and Status=1','Position asc');
	$iLine=count($aParentCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aParentCategory[$i]['Id']
					);
		$xtpl->assign('LOADMENU',$aArray);
		//childcategory
		$aChildCategory=$category->select('','','','Status=1 and RootId='.$aParentCategory[$i]['Id'],'Position asc');
		
		$iChildLine=count($aChildCategory);
		for($j=0 ; $j < $iChildLine ; $j++)
		{	
			$aArray=array(
					'ID'=>$aChildCategory[$j]['Id'],
					'ROOTID'=>$aChildCategory[$j]['RootId'],
					'NAME'=>$aChildCategory[$j]['Name']
					);
			
			$xtpl->assign('SUBMENU',$aArray);
			$xtpl->parse('MAIN.LOADMENU.SUBMENU');
		}
		//end childcategory
		$xtpl->parse('MAIN.LOADMENU');
	}
	//end loadmenu
	
	$aFolderName=array(
					'member'=>'member',
					'admin'=>'admin',
					'newsdetail'=>'news',
					'news'=>'news',
					'provider'=>'provider',
					'manufacturer'=>'manufacturer',
					'category'=>'category',
					'property'=>'property',
					'unit'=>'unit',
					'currency'=>'currency',
					'product'=>'product',
					'productdetail'=>'product',
					'ajax'=>'ajax',
					'cart'=>'cart',
					'contact'=>'contact',
					'intro'=>'intro',
					'service'=>'service',
					'rules'=>'rules',
					'register'=>'register',
					'buy'=>'buy',
					'membertree'=>'membertree',
					'support' => 'support', // Hỗ trợ viên
					'static'=>'static', // static content
					);
					
	//toptadv
		//get top adv
		$oTopAdv=new clsAdvertising();
		
		$sTopAdv=$oTopAdv->getTop();
		
		$xtpl->assign('TOPADV',$sTopAdv);
		$xtpl->parse('MAIN.LISTTOPADV');
		//end get top adv			
	
	//left
		//leftmenu
		include "components/leftmenu/leftmenu.php";
		$xtpl->assign('LEFTMENU',$HTMLLeftmenu);
		
		if($_GET['page']=='news' || $_GET['page']=='newsdetail')
		{
			//leftnewsmenu
			include "components/leftnewsmenu/leftnewsmenu.php";
			$xtpl->assign('LEFTNEWSMENU',$HTMLLeftnewsmenu);
			$xtpl->parse('MAIN.LEFTNEWSMENU');
		}
		
		//help
		include "components/help/help.php";
		$xtpl->assign('HELP',$HTMLHelp);
		
		//rule
		include "components/rule/rule.php";
		$xtpl->assign('RULE',$HTMLRule);
		
		//rule
		include "components/static/static.php";
		$xtpl->assign('STATIC',$HTMLStatic);
		
		//leftadv
		include "components/leftadv/leftadv.php";
		$xtpl->assign('LEFTADV',$HTMLLeftadv);
	//end left
		
	//content
	
	//topmenu
	include "components/topmenu/topmenu.php";
	$xtpl->assign('TOPMENU',$HTMLTopmenu);
		
	if(!isset($_GET['page']) || $_GET['page']=="")
	{
		include "components/home/home.php";
		$xtpl->assign('CONTENT',$HTMLHome);
	}
	else
	{
		$page="modules/".$aFolderName[$_GET['page']]."/".$_GET['page'].".php";
		if(is_file($page))
		{
			include "$page";
			$xtpl->assign('CONTENT',$HTMLContent);
		}
		else
		{
			$page="components/home/home.php";
			include "$page";
			$xtpl->assign('CONTENT',$HTMLHome);
		}
	}
	//end content
	
	//right
		//login
		include "components/login/login.php";
		$xtpl->assign('LOGIN',$HTMLLogin);
		//hotnews
		include "components/hotnews/hotnews.php";
		$xtpl->assign('HOTNEWS',$HTMLHotnews);
		
		//saleproduct
		include "components/saleproduct/saleproduct.php";
		$xtpl->assign('SALEPRODUCT',$HTMLSaleproduct);
		//rightadv
		include "components/rightadv/rightadv.php";
		$xtpl->assign('RIGHTADV',$HTMLRightadv);
	//end right
	
	$xtpl->parse('MAIN');
	$xtpl->out('MAIN');
?>