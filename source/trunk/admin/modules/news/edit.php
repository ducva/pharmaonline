<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/news/edit.tpl');
	include("FCKeditor/fckeditor.php");
	include "include/function.php";
	$news=new clsTable('news');
	$iNewsId=$_GET['id'];
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		$sTitle=$_POST['txtTitle'];
		$iNewsCategoryId=$_POST['cboNewsCategoryId'];
		
		//xu ly anh
		if($_POST['chkNewImage']==1)
		{
			if(basename($_FILES['txtImage']['name'])!="")
			{
				//delete image
				$aNews=$news->select('','','','Id='.$iNewsId);
				$sThumbImage='../images/upload/news/thumbs/'.$aNews[0]['Image'];
				$sImage='../images/upload/news/'.$aNews[0]['Image'];
				if(is_file($sThumbImage))
					unlink($sThumbImage);
				if(is_file($sImage))
					unlink($sImage);
				//end delete image
				
				$sUploadDir="../images/upload/news/";
				$sUploadThumbDir="../images/upload/news/thumbs/";
				$sTmpDir="../images/upload/news/tmp/";
				$iLeng=strlen(basename($_FILES['txtImage']['name']));
				$iBegin=$iLeng-3;
				$sImageExt=substr(basename($_FILES['txtImage']['name']),$iBegin,3);
				$sImageName=$iNewsId.".".$sImageExt;
				$sUploadfile=$sUploadDir.$sImageName;
				move_uploaded_file($_FILES['txtImage']['tmp_name'],$sTmpDir.$sImageName);
				thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadThumbDir,100);
				thumbnail($sTmpDir.$sImageName,$_FILES['txtImage']['type'],$sImageName,$sUploadDir,200);
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
		if(!empty($_POST['chkHotNews']))
			$iHotNews=1;
		else
			$iHotNews=0;
		
		//add news
		$news->update("Title='$sTitle',Description='$sDescription',Detail='$sDetail'".$sImage.",ImageNote='$sImageNote',newscategoryId='$iNewsCategoryId',HotNews='$iHotNews',ModifyDate='now()'","Id=".$iNewsId);
		//end add news
		$sMessage="<script>alert('Cập nhật thành công!\\n Nếu sau khi cập nhật, ảnh minh họa chưa thay đổi. \\n Xin bạn vui lòng ấn F5!');window.location='?page=news&do=list';</script>";
		$edit->assign('MESSAGE',$sMessage);
	}
	
	$aNews=$news->select('','','','Id='.$iNewsId);
	
	$edit->assign('TITLE',$aNews[0]['Title']);
	$edit->assign('IMAGE','../images/upload/news/thumbs/'.$aNews[0]['Image']);
	$edit->assign('IMAGENOTE',$aNews[0]['ImageNote']);
	
	//hotnews
	if($aNews[0]['HotNews']==1)
		$sHotNewsChecked='checked';
	else
		$sHotNewsChecked='';
	$edit->assign('HOTNEWSCHECKED',$sHotNewsChecked);	
	//end hotnews
	
	//cboNewsCategory
	$newscategory= new clsTable('newscategory');
	$aNewsCategory=$newscategory->select('','','','RootId=0','Position asc');
	$iLine=count($aNewsCategory);
	for($i=0 ; $i < $iLine ; $i++)
	{
		if($aNews[0]['newscategoryId']==$aNewsCategory[$i]['Id'])
			$sSelected='selected';
		else
			$sSelected='';
		
		$aArray=array(
					'ID'=>$aNewsCategory[$i]['Id'],
					'NAME'=>$aNewsCategory[$i]['Name'],
					'SELECTED'=>$sSelected
					);
		$edit->assign('NEWSCATEGORY',$aArray);
		//cboChildNewsCategory
		$aChildNewsCategory=$newscategory->select('','','','RootId='.$aNewsCategory[$i]['Id'],'Position asc');
		$iChildLine=count($aChildNewsCategory);
		for($j=0 ; $j < $iChildLine ; $j++)
		{
			if($aNews[0]['newscategoryId']==$aChildNewsCategory[$j]['Id'])
				$sSelected='selected';
			else
				$sSelected='';
		
			$aArray=array(
					'ID'=>$aChildNewsCategory[$j]['Id'],
					'NAME'=>$aChildNewsCategory[$j]['Name'],
					'SELECTED'=>$sSelected
					);
			$edit->assign('CHILDNEWSCATEGORY',$aArray);
			$edit->parse('MAIN.NEWSCATEGORY.CHILDNEWSCATEGORY');
		}
		//end cboChildNewsCategory
		$edit->parse('MAIN.NEWSCATEGORY');
	}
	//end cboNewsCategory
	
	//Description
	$oFCKeditor = new FCKeditor('txtDescription') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Height		= 200;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= $aNews[0]['Description'];
	$sDescription = $oFCKeditor->CreateHtml() ;
	$edit->assign('DESCRIPTION',$sDescription);
	//end Description
	
	//Detail
	$oFCKeditor = new FCKeditor('txtDetail') ;
	$oFCKeditor->ToolbarSet = 'VietSun';
	$oFCKeditor->BasePath	= 'FCKeditor/' ;
	$oFCKeditor->Height		= 400;
	$oFCKeditor->Config['AutoDetectLanguage']	= false;
	$oFCKeditor->Config['DefaultLanguage']		= 'vi' ;
	$oFCKeditor->Value		= $aNews[0]['Detail'];
	$sDetail = $oFCKeditor->CreateHtml() ;
	$edit->assign('DETAIL',$sDetail);
	//end Detail
	
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>