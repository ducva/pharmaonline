<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/product/add.tpl');
	include("FCKeditor/fckeditor.php");
	include "include/function.php";
	$product=new clsTable('product');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$sName=$_POST['txtName'];
		$sCode=strtoupper($_POST['txtCode']);
		$iCategoryId=$_POST['cboCategoryId'];
		
		//xu ly anh
		if(basename($_FILES['txtImage']['name'])!="")
		{
			$sUploadDir="../images/upload/product/";
			$sUploadThumbDir="../images/upload/product/thumbs/";
			$sTmpDir="../images/upload/product/tmp/";
			$iLeng=strlen(basename($_FILES['txtImage']['name']));
			$iBegin=$iLeng-3;
			$sImageExt=substr(basename($_FILES['txtImage']['name']),$iBegin,3);
			$sImageName=($product->firstblank()).".".$sImageExt;
			$sUploadfile=$sUploadDir.$sImageName;
			move_uploaded_file($_FILES['txtImage']['tmp_name'],$sTmpDir.$sImageName);
			thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadThumbDir,100);
			thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadDir,300);
			unlink($sTmpDir.$sImageName);
			//thumbnail($src_url, $type, $src_name, $sUploadDir, $iWidth) 
		}
		else 	
			$sImageName="";
		//end xu ly anh
		
		$sImageNote=$_POST['txtImageNote'];
		$sDescription=$_POST['txtDescription'];
		$sDetail=$_POST['txtDetail'];
		$iHotProduct=$_POST['radHotProduct'];
		$sPrice=$_POST['txtPrice'];
		$sPriceQTM=$_POST['txtPriceQTM'];
		$iCurrency=$_POST['cboCurrency'];
		$iUnit=$_POST['cboUnit'];
		$iProvider=$_POST['cboProvider'];
		$iManufacturer=$_POST['cboManufacturer'];
	
		//add property
		$iProductId=$product->firstblank();
			//get list propertyId
			$category=new clsTable('category');
			$aCategory=$category->select('','','','Id='.$iCategoryId);
			$sListPropertyId=$aCategory[0]['ListPropertyId'];
			
			$sListPropertyId=str_replace(",","','",$sListPropertyId);
			$property=new clsTable('property');
			$aProperty=$property->select("","","","Id IN ('".$sListPropertyId."')");
			$iLine=count($aProperty);
			for($i=0 ; $i < $iLine ; $i++)
			{
				if(isset($_POST['txtProperty'.$aProperty[$i]['Id']]))
				{
					$productproperty=new clsTable('productproperty');
					$productproperty->insert("productId,propertyId,Value","'".$iProductId."','".$aProperty[$i]['Id']."','".$_POST['txtProperty'.$aProperty[$i]['Id']]."'");
				}
			}
			//end get list propertyId
		//end add property
		
		//add product
		$product->insert("Name,Code,Description,Detail,Image,ImageNote,categoryId,HotProduct,CreateDate,ModifyDate,Price,PriceQTM,currencyId,unitId,providerId,manufacturerId","'$sName','$sCode','$sDescription','$sDetail','$sImageName','$sImageNote','$iCategoryId','$iHotProduct',now(),now(),'$sPrice','$sPriceQTM','$iCurrency','$iUnit','$iProvider','$iManufacturer'");
		//end add product
		$sMessage="<script>alert('Bạn đã thêm thành công sản phẩm mới vào hệ thống');window.location='?page=product&do=add';</script>";
		
		$add->assign('MESSAGE',$sMessage);
	}
	
	//cboCategory
	$category= new clsTable('category');
	$aCategory=$category->select('','','','RootId=0','Position asc');
	$iLine=count($aCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aCategory[$i]['Id'],
					'NAME'=>$aCategory[$i]['Name']
					);
		$add->assign('CATEGORY',$aArray);
		//cboChildCategory
		$aChildCategory=$category->select('','','','RootId='.$aCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildCategory);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			$aArray=array(
					'ID'=>$aChildCategory[$j]['Id'],
					'NAME'=>$aChildCategory[$j]['Name']
					);
			$add->assign('CHILDCATEGORY',$aArray);
			$add->parse('MAIN.CATEGORY.CHILDCATEGORY');
		}
		//end cboChildCategory
		$add->parse('MAIN.CATEGORY');
	}
	//end cboCategory
	
	//currency
	$currency=new clsTable('currency');
	$aCurrency=$currency->select('','','','','Position asc');
	$iLine=count($aCurrency);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(	
					'VALUE'=>$aCurrency[$i]['Id'],
					'NAME'=>$aCurrency[$i]['Name']
					);
		$add->assign('CURRENCY',$aArray);
		$add->parse('MAIN.CURRENCY');
	}
	//end currency
	
	//unit
	$unit=new clsTable('unit');
	$aUnit=$unit->select('','','','','Position asc');
	$iLine=count($aUnit);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(	
					'VALUE'=>$aUnit[$i]['Id'],
					'NAME'=>$aUnit[$i]['Name']
					);
		$add->assign('UNIT',$aArray);
		$add->parse('MAIN.UNIT');
	}
	//end unit
	
	//provider
	$provider=new clsTable('provider');
	$aProvider=$provider->select('','','','','Position asc');
	$iLine=count($aProvider);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(	
					'VALUE'=>$aProvider[$i]['Id'],
					'NAME'=>$aProvider[$i]['Name']
					);
		$add->assign('PROVIDER',$aArray);
		$add->parse('MAIN.PROVIDER');
	}
	//end provider
	
	//manufacturer
	$manufacturer=new clsTable('manufacturer');
	$aManufacturer=$manufacturer->select('','','','','Position asc');
	$iLine=count($aManufacturer);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(	
					'VALUE'=>$aManufacturer[$i]['Id'],
					'NAME'=>$aManufacturer[$i]['Name']
					);
		$add->assign('MANUFACTURER',$aArray);
		$add->parse('MAIN.MANUFACTURER');
	}
	//end manufacturer
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>