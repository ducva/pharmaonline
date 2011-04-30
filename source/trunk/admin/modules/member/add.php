<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$add=new XTemplate('html/modules/member/add.tpl');
	
	$member=new clsTable('member');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đồng ý')
	{
		//kiem tra su ton tai cua user
		$sUsername = $_POST['txtUsername'];
		$aMember=$member->select("","","","Username ='$sUsername'");
		$aTestRoot = $member->select('', '', '', 'Id = '.$_POST['txtRootId']);
		if(count($aTestRoot) == 0 && $_POST['txtRootId'] != 0)
		{
			$aMember = array('FULLNAME' => $_POST['txtFullname'], 'ADDRESS' => $_POST['txtAddress'], 'WRONGROOTID' => '<SPAN class=note>&nbsp;<i>(Mã không chính xác)</i></SPAN>', 'USERNAME' => $_POST['txtUsername'], 'EMAIL' => $_POST['txtEmail'], 'TELEPHONE' => $_POST['txtTelephone'], 'MOBILE' => $_POST['txtMobile']);
			
		}
		elseif(count($aMember) > 0)
		{
			$aMember = array('FULLNAME' => $_POST['txtFullname'], 'ADDRESS' => $_POST['txtAddress'], 'ROOTID' => $_POST['txtRootId'], 'WRONGUSERNAME' => '<SPAN class=note>&nbsp;<i>(Tên đã được đăng ký bởi người khác)</i></SPAN>', 'EMAIL' => $_POST['txtEmail'], 'TELEPHONE' => $_POST['txtTelephone'], 'MOBILE' => $_POST['txtMobile']);
				
		}
		else 
		{
			//end kiem tra su ton tai cua user
			$aMember = array();
			$aMember['Username'] = $_POST['txtUsername'];
			$aMember['Password'] = md5($_POST['txtPassword']);
			$aMember['BirthDate'] = $_POST['cboYear'].'-'.$_POST['cboMonth'].'-'.$_POST['cboDay'];
			$aMember['Fullname'] = $_POST['txtFullname'];
			$aMember['Address'] = $_POST['txtAddress'];
			$aMember['Telephone'] = $_POST['txtTelephone'];
			$aMember['Mobile'] = $_POST['txtMobile'];
			$aMember['Email'] = $_POST['txtEmail'];
			$aMember['RootId'] = $_POST['txtRootId'];
			$oMember = new clsMember($aMember);
			echo "<script>alert('Bạn đã thêm thành công thành viên mới vào hệ thống');window.location='?page=member&do=add';</script>";
		}
		
	}
	else 
	{
		$aMember = array('FULLNAME' => '', 'ADDRESS' => '', 'ROOTID' => 0, 'USERNAME' => '', 'EMAIL' => '', 'TELEPHONE' => '', 'MOBILE' => '');
	}
	
	//cbo day
	for($i=1 ; $i <= 31 ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if(isset($_POST['cboDay']) && $_POST['cboDay'] == $i)
			$aArray['DAY'] = 'selected';
		$add->assign('DAY',$aArray);
		$add->parse('MAIN.DAY');
	}
	//end cbo day
	
	//cbo month
	for($i=1 ; $i <= 12 ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if(isset($_POST['cboMonth']) && $_POST['cboMonth'] == $i)
			$aArray['MONTH'] = 'selected';
		$add->assign('MONTH',$aArray);
		$add->parse('MAIN.MONTH');
	}
	//end cbo month
	
	//cbo year
	for($i=1900 ; $i <= date("Y") ; $i++)
	{
		$aArray=array(
					'VALUE'=>$i,
					'NAME'=>$i
					);
		if(isset($_POST['cboYear']) && $_POST['cboYear'] == $i)
			$aArray['YEAR'] = 'selected';
		$add->assign('YEAR',$aArray);
		$add->parse('MAIN.YEAR');
	}
	//end cbo year
	$add->assign('MAIN', $aMember);
	$add->parse('MAIN');
	$HTMLContent=$add->text('MAIN');	
?>