<?php	$oStatic=new XTemplate('html/components/static/static.tpl');
	$viewss = file("images/views.txt"); 
	$views = $viewss[0];
	$views++; 
	$fp = fopen("images/views.txt", "w"); 
	fwrite($fp, $views); 
	fclose($fp); 
	$oStatic->assign('VIEWS',$views);
	
	$oUsersOnline=new clsUsersOnline();
	$oStatic->assign('ONLINES',$oUsersOnline->getNumber());
	
	/*$category=new clsTable('category');
	$aCategory=$category->select('','','','RootId != 0');
	$oStatic->assign('TOTALCATEGORY',count($aCategory));
	
	$product=new clsTable('product');
	$aProduct=$product->select();
	$oStatic->assign('TOTALPRODUCT',count($aProduct));*/
	
	$oStatic->parse('MAIN');
	$HTMLStatic=$oStatic->text('MAIN');
?>