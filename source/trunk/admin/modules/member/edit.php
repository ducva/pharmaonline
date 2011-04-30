<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$edit=new XTemplate('html/modules/member/edit.tpl');
	$member=new clsTable('member');
	$oMember = new clsMember($_GET['id']);
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		
		$aMember=$member->select("","","","Username ='".$_POST['txtUsername']."'");
		$aTestRoot = $member->select('', '', '', 'Id = '.$_POST['txtRootId']);
		if(count($aTestRoot) == 0 && $_POST['txtRootId'] != 0)
		{
			$aMember = array('FULLNAME' => $_POST['txtFullname'], 'ADDRESS' => $_POST['txtAddress'], 'WRONGROOTID' => '<SPAN class=note>&nbsp;<i>(Mã không chính xác)</i></SPAN>', 'USERNAME' => $_POST['txtUsername'], 'EMAIL' => $_POST['txtEmail'], 'TELEPHONE' => $_POST['txtTelephone'], 'MOBILE' => $_POST['txtMobile']);
			
		}
		elseif((count($aMember) > 0) && ($_POST['txtUsername'] != $oMember->aVar['Username']))
		{
			$aMember = array('FULLNAME' => $_POST['txtFullname'], 'ADDRESS' => $_POST['txtAddress'], 'ROOTID' => $_POST['txtRootId'], 'WRONGUSERNAME' => '<SPAN class=note>&nbsp;<i>(Tên đã được đăng ký bởi người khác)</i></SPAN>', 'EMAIL' => $_POST['txtEmail'], 'TELEPHONE' => $_POST['txtTelephone'], 'MOBILE' => $_POST['txtMobile']);
				
		}
		else 
		{
			//end kiem tra su ton tai cua user
			$aMember = array();
			$aMember['Username'] = $_POST['txtUsername'];
			$aMember['Password'] = $_POST['txtPassword'];
			$aMember['BirthDate'] = $_POST['cboYear'].'-'.$_POST['cboMonth'].'-'.$_POST['cboDay'];
			$aMember['Fullname'] = $_POST['txtFullname'];
			$aMember['Address'] = $_POST['txtAddress'];
			$aMember['Telephone'] = $_POST['txtTelephone'];
			$aMember['Mobile'] = $_POST['txtMobile'];
			$aMember['Email'] = $_POST['txtEmail'];
			$aMember['RootId'] = $_POST['txtRootId'];
			$oMember->Update($aMember);
			echo "<script>alert('Bạn đã sửa thành công thông tin thành viên!');window.location='?page=member&do=list';</script>";
		}
		
	}
	else 
	{
		$aMember = array('FULLNAME' => $oMember->aVar['Fullname'], 'ADDRESS' => $oMember->aVar['Address'], 'ROOTID' => $oMember->aVar['RootId'], 'USERNAME' => $oMember->aVar['Username'], 'EMAIL' => $oMember->aVar['Email'], 'TELEPHONE' => $oMember->aVar['Telephone'], 'MOBILE' => $oMember->aVar['Mobile']);
	}
	
	//cbo day
	for($i=1 ; $i <= 31 ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if($oMember->aVar['BirthDay'] == $i)
			$aArray['DAY'] = 'selected';
		$edit->assign('DAY',$aArray);
		$edit->parse('MAIN.DAY');
	}
	//end cbo day
	
	//cbo month
	for($i=1 ; $i <= 12 ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if($oMember->aVar['BirthMonth'] == $i)
			$aArray['MONTH'] = 'selected';
		$edit->assign('MONTH',$aArray);
		$edit->parse('MAIN.MONTH');
	}
	//end cbo month
	
	//cbo year
	for($i=1900 ; $i <= date("Y") ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if($oMember->aVar['BirthYear'] == $i)
			$aArray['YEAR'] = 'selected';
		$edit->assign('YEAR',$aArray);
		$edit->parse('MAIN.YEAR');
	}
	//end cbo year
	$edit->assign('MAIN', $aMember);
	$edit->parse('MAIN');
	$HTMLContent=$edit->text('MAIN');	
?>