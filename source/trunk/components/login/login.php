<?php	$oLogin=new XTemplate('html/components/login/login.tpl');
	
	//logout
	if(isset($_GET['do']) && $_GET['do']=='logout')
	{
		session_unregister('Username');
		session_unregister('Fullname');
		session_unregister('Telephone');
		session_unregister('Mobile');
		session_unregister('JoinDate');
		session_unregister('ProductCart');
		session_destroy();
		$_SESSION['UserLogin']="N";
		$sMessage="<script>window.location='index.php';</script>";
		$oLogin->assign('MESSAGE',$sMessage);
	}
	//end logout
	
	if(isset($_POST['btnLogin']) && $_POST['btnLogin']=='Đăng nhập')
	{
		$sURL=$_SERVER['QUERY_STRING'];
		$sUsername=$_POST['txtUsername'];
		$sPassword=md5($_POST['txtPassword']);
		$member= new clsTable('member');
		$aMember=$member->select("*,date_format(JoinDate,'%d-%m-%Y') as JoinDate","","","Username='$sUsername' and Password='$sPassword'");
		if(count($aMember) > 0)
		{
			$_SESSION['UserLogin']="Y";
			$_SESSION['Username']=$aMember[0]['Username'];
			$_SESSION['UserId']=$aMember[0]['Id'];
			$_SESSION['Fullname']=$aMember[0]['Fullname'];
			$_SESSION['Telephone']=$aMember[0]['Telephone'];
			$_SESSION['Mobile']=$aMember[0]['Mobile'];
			$_SESSION['JoinDate']=$aMember[0]['JoinDate'];
			$_SESSION['ProductCart']=array();
			//$_SESSION['aQuantityProduct']='';
			$sMessage="<script>window.location='index.php?".$sURL."';</script>";
			$oLogin->assign('MESSAGE',$sMessage);
			//$_SESSION['Cart']->add(10,10);			
		}
		else
		{
			$sMessage="<script>alert('Sai tên truy cập hoặc mật khẩu! Xin bạn vui lòng kiểm tra lại');window.location='index.php?".$sURL."';</script>";
			$oLogin->assign('MESSAGE',$sMessage);
		}
	}
	
	if(!session_is_registered('UserLogin'))
	{
		$_SESSION['UserLogin']="N";
	}
	if($_SESSION['UserLogin']=="N")
	{
		$oLogin->assign('TITLE','Đăng nhập');
		$oLogin->parse('MAIN.LOGINNO');
	}
	else
	{
		$cart=new clsCart($_SESSION['ProductCart']);
		$iCurrentMoney=sPriceFormat($cart->iGetTotalMoney());
		$oMember=new clsMember($_SESSION['UserId'],date('m-Y'));
		$oLogin->assign('TITLE','Thông tin thành viên');
		$oLogin->assign('MONTH',$oMember->sDate);
		$oLogin->assign('TOTALMONEY',sPriceFormat($oMember->iTotalMoney));
		$oLogin->assign('ID',$_SESSION['UserId']);
		$oLogin->assign('CURRENTMONEY',$iCurrentMoney);
		$oLogin->assign('FULLNAME',$_SESSION['Fullname']);
		$oLogin->assign('USERNAME',$_SESSION['Username']);
		$oLogin->assign('TELEPHONE',$_SESSION['Telephone']);
		$oLogin->assign('MOBILE',$_SESSION['Mobile']);
		$oLogin->assign('JOINDATE',$_SESSION['JoinDate']);
		$oLogin->parse('MAIN.LOGINYES');
	}
	$oLogin->parse('MAIN');
	$HTMLLogin=$oLogin->text('MAIN');
?>