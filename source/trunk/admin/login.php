<META http-equiv=Content-Type content="text/html; charset=utf-8">
<?php
	//init
	include_once "../classdatabase/clsDatabase.php";
	include_once "../include/publics.php";
	include_once "include/xtpl.php";
	//end init
	$xtpl = new XTemplate('html/login.tpl');
	
	if(isset($_POST['btnSubmit']) && $_POST['btnSubmit']=='Đăng nhập')
	{
		include_once "../classdatabase/clstable.php";
		$sUsername=$_POST['txtUsername'];
		$sPassword=md5($_POST['txtPassword']);
		$admin=new clsTable('admin');
		$aAdmin=$admin->select('','','',"Username='$sUsername' and Password='$sPassword'");
		//$aAdmin=$admin->select('','','',"Id=1");
		$iLine=count($aAdmin);
		if($iLine > 0)
		{
			session_register("login");
			$_SESSION['login']="Y";
			session_register("UserId");
			$_SESSION['UserId']=$aAdmin[0]['Id'];
			session_register("Username");
			$_SESSION['Username']=$aAdmin[0]['Username'];
			$sMessage='<meta http-equiv=refresh content="0;URL=index.php">';
			$xtpl->assign('SUCCEED','Đăng nhập thành công <BR><img src="images/loading.gif">');
			$xtpl->parse('MAIN.LOGIN_SUCCEED');
			$xtpl->assign('MESSAGE',$sMessage);	
		}
		else
		{
			$sMessage="<script>alert('Sai tên đăng nhập hoặc mật khẩu');history.go(-1)</script>";
			$xtpl->assign('MESSAGE',$sMessage);
		}
	}
	else
	{
		$xtpl->parse('MAIN.LOGIN');
	}

	$xtpl->parse('MAIN');
	$xtpl->out('MAIN');

?>