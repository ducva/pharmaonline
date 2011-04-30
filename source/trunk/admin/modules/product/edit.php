<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/product/edit.tpl');
	include("FCKeditor/fckeditor.php");
	include "include/function.php";
	$product=new clsTable('product');
	$iProductId=$_GET['id']	;
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$sName=$_POST['txtName'];
		$sCode=strtoupper($_POST['txtCode']);
		$iCategoryId=$_POST['cboCategoryId'];
		
		//xu ly anh
		if(!empty($_POST['chkNewImage']))
		{
			if(basename($_FILES['txtImage']['name'])!="")
			{
				//delete image
				$aProduct=$product->select('','','','Id='.$iProductId);
				$sThumbImage='../images/upload/product/thumbs/'.$aProduct[0]['Image'];
				$sImage='../images/upload/product/'.$aProduct[0]['Image'];
				if(is_file($sThumbImage))
					unlink($sThumbImage);
				if(is_file($sImage))
					unlink($sImage);
				//end delete image
				
				$sUploadDir="../images/upload/product/";
				$sUploadThumbDir="../images/upload/product/thumbs/";
				$sTmpDir="../images/upload/product/tmp/";
				$iLeng=strlen(basename($_FILES['txtImage']['name']));
				$iBegin=$iLeng-3;
				$sImageExt=substr(basename($_FILES['txtImage']['name']),$iBegin,3);
				$sImageName=$iProductId.".".$sImageExt;
				$sUploadfile=$sUploadDir.$sImageName;
				move_uploaded_file($_FILES['txtImage']['tmp_name'],$sTmpDir.$sImageName);
				thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadThumbDir,100);
				thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadDir,300);
				unlink($sTmpDir.$sImageName);
				$sImage=",Image='".$sImageName."'";
				//thumbnail($src_url, $type, $src_name, $sUploadDir, $iWidth) 
			}
			else 	
				$sImage="";
		}
		else
			$sImage="";
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
	
		//edit property
			//get list propertyId
			$category=new clsTable('category');
			$aCategory=$category->select('','','','Id='.$iCategoryId);
			$sListPropertyId=$aCategory[0]['ListPropertyId'];
			
			$sListPropertyId=str_replace(",","','",$sListPropertyId);
			
			//neu chon categoryId khac
			if($_POST['hdnOldCategoryId'] != $iCategoryId)
			{
				//xoa thong tin thuoc tinh cu
				$productproperty=new clsTable('productproperty');
				$productproperty->delete('productId='.$iProductId);
				
				//them thong tin thuoc tinh moi
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
				//end thong tin thuoc tinh moi
			}
			//end categoryId khac
			else
			{
				$property=new clsTable('property');
				$aProperty=$property->select("","","","Id IN ('".$sListPropertyId."')");
				$iLine=count($aProperty);
				for($i=0 ; $i < $iLine ; $i++)
				{
					if(isset($_POST['txtProperty'.$aProperty[$i]['Id']]))
					{
						$productproperty=new clsTable('productproperty');
						$productproperty->update("Value='".$_POST['txtProperty'.$aProperty[$i]['Id']]."'","productId='".$iProductId."' and propertyId='".$aProperty[$i]['Id']."'");
					}
				}
			}
			//end get list propertyId
		//end edit property
		
		//edit product
		$product->update("Name='$sName',Code='$sCode',Description='$sDescription',Detail='$sDetail'".$sImage.",ImageNote='$sImageNote',categoryId='$iCategoryId',HotProduct='$iHotProduct',ModifyDate=now(),Price='$sPrice',PriceQTM='$sPriceQTM',currencyId='$iCurrency',unitId='$iUnit',providerId='$iProvider',manufacturerId='$iManufacturer'","Id=".$iProductId);
		//end edit product
		$sMessage="<script>alert('Cập nhật thành công');window.location='?page=product&do=edit&id=".$iProductId."';</script>";
		
		$edit->assign('MESSAGE',$sMessage);
	}
	$iProductId=$_GET['id'];
	$aProduct=$product->select('','','','Id='.$iProductId);

	$edit->assign('CHECKED_'.$aProduct[0]['HotProduct'],'checked');
	$edit->assign('NAME',$aProduct[0]['Name']);
	$edit->assign('CODE',$aProduct[0]['Code']);
	$edit->assign('PRICE',$aProduct[0]['Price']);
	$edit->assign('PRICEQTM',$aProduct[0]['PriceQTM']);
	$edit->assign('CATEGORYID',$aProduct[0]['categoryId']);
	$edit->assign('IMAGE','../images/upload/product/thumbs/'.$aProduct[0]['Image']);
	//$edit->assign('HOTPRODUCTCHECKED',$sHotProduct);
	$edit->assign('DESCRIPTION',$aProduct[0]['Description']);
	$edit->assign('DETAIL',$aProduct[0]['Detail']);
	$edit->assign('IMAGENOTE',$aProduct[0]['ImageNote']);
	
	$sProperty="<script>Reload_Body('ajax/ajax.php?productId=".$iProductId."&categoryId='+".$aProduct[0]['categoryId'].",'Property')</script>";
	$edit->assign('PROPERTY',$sProperty);
	
	//cboCategory
	$category= new clsTable('category');
	$aCategory=$category->select('','','','RootId=0','Position asc');
	$iLine=count($aCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aCategory[$i]['Id']==$aProduct[0]['categoryId'])
			$sSelected='selected';
		else 	
			$sSelected='';
			
		$aArray=array(
					'ID'=>$aCategory[$i]['Id'],
					'NAME'=>$aCategory[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('CATEGORY',$aArray);
		//cboChildCategory
		$aChildCategory=$category->select('','','','RootId='.$aCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildCategory);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			if($aChildCategory[$j]['Id']==$aProduct[0]['categoryId'])
				$sSelected='selected';
			else 	
				$sSelected='';
			
			$aArray=array(
					'ID'=>$aChildCategory[$j]['Id'],
					'NAME'=>$aChildCategory[$j]['Name'],
					'SELECTED'=>$sSelected
					);
			$edit->assign('CHILDCATEGORY',$aArray);
			$edit->parse('MAIN.CATEGORY.CHILDCATEGORY');
		}
		//end cboChildCategory
		$edit->parse('MAIN.CATEGORY');
	}
	//end cboCategory
	
	//currency
	$currency=new clsTable('currency');
	$aCurrency=$currency->select('','','','','Position asc');
	$iLine=count($aCurrency);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aCurrency[$i]['Id']==$aProduct[0]['currencyId'])
			$sSelected='selected';
		else
			$sSelected='';
		
		$aArray=array(	
					'VALUE'=>$aCurrency[$i]['Id'],
					'NAME'=>$aCurrency[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('CURRENCY',$aArray);
		$edit->parse('MAIN.CURRENCY');
	}
	//end currency
	
	//unit
	$unit=new clsTable('unit');
	$aUnit=$unit->select('','','','','Position asc');
	$iLine=count($aUnit);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aUnit[$i]['Id']==$aProduct[0]['unitId'])
			$sSelected='selected';
		else
			$sSelected='';
			
		$aArray=array(	
					'VALUE'=>$aUnit[$i]['Id'],
					'NAME'=>$aUnit[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('UNIT',$aArray);
		$edit->parse('MAIN.UNIT');
	}
	//end unit
	
	//provider
	$provider=new clsTable('provider');
	$aProvider=$provider->select('','','','','Position asc');
	$iLine=count($aProvider);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aProvider[$i]['Id']==$aProduct[0]['providerId'])
			$sSelected='selected';
		else
			$sSelected='';
	
		$aArray=array(	
					'VALUE'=>$aProvider[$i]['Id'],
					'NAME'=>$aProvider[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('PROVIDER',$aArray);
		$edit->parse('MAIN.PROVIDER');
	}
	//end provider
	
	//manufacturer
	$manufacturer=new clsTable('manufacturer');
	$aManufacturer=$manufacturer->select('','','','','Position asc');
	$iLine=count($aProvider);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aManufacturer[$i]['Id']==$aProduct[0]['manufacturerId'])
			$sSelected='selected';
		else
			$sSelected='';
	
		$aArray=array(	
					'VALUE'=>$aManufacturer[$i]['Id'],
					'NAME'=>$aManufacturer[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('MANUFACTURER',$aArray);
		$edit->parse('MAIN.MANUFACTURER');
	}
	//end manufacturer
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>