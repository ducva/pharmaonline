<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/news/add.tpl');
	include("FCKeditor/fckeditor.php");
	include "include/function.php";
	$news=new clsTable('news');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$sTitle=$_POST['txtTitle'];
		$iNewsCategoryId=$_POST['cboNewsCategoryId'];
		
		//xu ly anh
		if(basename($_FILES['txtImage']['name'])!="")
		{
			$sUploadDir="../images/upload/news/";
			$sUploadThumbDir="../images/upload/news/thumbs/";
			$sTmpDir="../images/upload/news/tmp/";
			$iLeng=strlen(basename($_FILES['txtImage']['name']));
			$iBegin=$iLeng-3;
			$sImageExt=substr(basename($_FILES['txtImage']['name']),$iBegin,3);
			$sImageName=($news->firstblank()).".".$sImageExt;
			$sUploadfile=$sUploadDir.$sImageName;
			move_uploaded_file($_FILES['txtImage']['tmp_name'],$sTmpDir.$sImageName);
			thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadThumbDir,100);
			thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadDir,200);
			unlink($sTmpDir.$sImageName);
			//thumbnail($src_url, $type, $src_name, $sUploadDir, $iWidth) 
		}
		else 	
			$sImageName="";
		//end xu ly anh
		
		$sImageNote=$_POST['txtImageNote'];
		$sDescription=$_POST['txtDescription'];
		$sDetail=$_POST['txtDetail'];
		if(!empty($_POST['chkHotNews']))
			$iHotNews=1;
		else
			$iHotNews=0;
		
		//add news
		$news->insert("Title,Description,Detail,Image,ImageNote,newscategoryId,HotNews,WriteDate,ModifyDate","'$sTitle','$sDescription','$sDetail','$sImageName','$sImageNote','$iNewsCategoryId','$iHotNews',now(),now()");
		//end add news
		$sMessage="<script>alert('Bạn đã thêm thành công thành viên tin mới vào hệ thống');window.location='?page=news&do=add';</script>";
		
		$add->assign('MESSAGE',$sMessage);
	}
	
	//cboNewsCategory
	$newscategory= new clsTable('newscategory');
	$aNewsCategory=$newscategory->select('','','','RootId=0','Position asc');
	$iLine=count($aNewsCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		$aArray=array(
					'ID'=>$aNewsCategory[$i]['Id'],
					'NAME'=>$aNewsCategory[$i]['Name']
					);
		$add->assign('NEWSCATEGORY',$aArray);
		//cboChildNewsCategory
		$aChildNewsCategory=$newscategory->select('','','','RootId='.$aNewsCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildNewsCategory);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			$aArray=array(
					'ID'=>$aChildNewsCategory[$j]['Id'],
					'NAME'=>$aChildNewsCategory[$j]['Name']
					);
			$add->assign('CHILDNEWSCATEGORY',$aArray);
			$add->parse('MAIN.NEWSCATEGORY.CHILDNEWSCATEGORY');
		}
		//end cboChildNewsCategory
		$add->parse('MAIN.NEWSCATEGORY');
	}
	//end cboNewsCategory
	
	//Description
	$oFCKeditor = new FCKeditor('txtDescription') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Height		= 200;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= '';
	$sDescription = $oFCKeditor->CreateHtml() ;
	//end Description
	$add->assign('DESCRIPTION',$sDescription);
	
	//Detail
	$oFCKeditor = new FCKeditor('txtDetail') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Height		= 400;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= '';
	$sDetail = $oFCKeditor->CreateHtml() ;
	//end Detail
	$add->assign('DETAIL',$sDetail);
	
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>