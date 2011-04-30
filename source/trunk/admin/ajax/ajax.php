<?php
	include "../../include/xtpl.php";
	//init
	include "../../classdatabase/clsDatabase.php";
	include "../../classdatabase/clstable.php";
	include "../../include/publics.php";
	//end init
	
	$ajax=new XTemplate('../html/ajax/ajax.tpl');
	$category=new clsTable('category');
	$iCategoryId=$_GET['categoryId'];
	$aCategory=$category->select('','','','Id='.$iCategoryId);
	$sListPropertyId=$aCategory[0]['ListPropertyId'];
	$aListPropertyId=explode(',',$sListPropertyId);
	$iSPT=count($aListPropertyId);
	
	$property=new clsTable('property');
	for($i=0 ; $i < $iSPT-1 ; $i++)
	{
		$aProperty=$property->select('','','','Id='.$aListPropertyId[$i]);
	
		//neu la thuoc tinh cha
		if($aProperty[0]['RootId']==0)
		{
			$aArray=array(
						'ID'=>$aProperty[0]['Id'],
						'NAME'=>$aProperty[0]['Name']
						);
			$ajax->assign('PARENTPROPERTY',$aArray);
			$ajax->parse('MAIN.LISTPROPERTY.PARENTPROPERTY');
			$ajax->parse('MAIN.LISTPROPERTY');
		}
		//end thuoc tinh cha
		//neu la thuoc tinh con
		else
		{
			if(isset($_GET['productId']))
			{
				$productproperty=new clsTable('productproperty');
				$aProductProperty=$productproperty->select('','','','propertyId='.$aProperty[0]['Id'].' and productId='.$_GET['productId']);
				$sValue=$aProductProperty[0]['Value'];
			}
			else 	
				$sValue='';
				
			$aArray=array(
						'ID'=>$aProperty[0]['Id'],
						'NAME'=>$aProperty[0]['Name'],
						'UNIT'=>$aProperty[0]['Unit'],
						'VALUE'=>$sValue
						);
			$ajax->assign('CHILDPROPERTY',$aArray);
			$ajax->parse('MAIN.LISTPROPERTY.CHILDPROPERTY');
			$ajax->parse('MAIN.LISTPROPERTY');
		}
		//thuoc tinh con
	}
	$ajax->parse('MAIN');
	$HTMLAjax=$ajax->text('MAIN');
	echo $HTMLAjax;
?>