<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	$listproduct=new XTemplate('html/modules/member/list.tpl');
	$member=new clsTable('member');
	//delete / up / down
	if(isset($_GET['action']) && $_GET['action'] != '')
	{
		switch($_GET['action'])
		{
			case "delete":
				if($_GET['id']!="")
				{
					$member->delete('Id = '.$_GET['id']);
					echo '<script>window.location = "?page=member&do=list"</script>';
				}
				break;
			
		}
		
	}
	//end delete / up / down
	
	//search
	if(isset($_GET['keyword']) && $_GET['keyword'] != '')
	{
		$sKey = $_GET['keyword'];
		$sCondition="Fullname like '%".$sKey."%' or Username like '%".$sKey."%'";
	}
	else
		$sCondition="";
	//end search
	
	$aMember=$member->select('*,date_format(JoinDate,"%d-%m-%Y") as JoinDate','','',$sCondition, 'Id');
	$iLine=count($aMember);

//phan trang
	$paging = new clsPaging($iLine, 10, 5, $listproduct);
//end phan trang	
		
		for($i=0;$i<$iLine;$i++)
		{
			if($paging->bGetContent($i))
			{	
				$oMember = new clsMember($aMember[$i]);
				$aArray[$i]= array(
									'ID'=>$oMember->aVar['Id'] , 
									'FULLNAME'=>$oMember->aVar['Fullname'] , 
									'USERNAME'=>$oMember->aVar['Username'],
									'EMAIL'=>$oMember->aVar['Email'],
									'JOINDATE'=>$oMember->aVar['JoinDate'],
									'POINT'=>$oMember->iPoint,
									'TOTALPOINT' => $oMember->iTotalPoint,
									'PERCENT' => $oMember->iPercent);
				$listproduct->assign('LISTMEMBER',$aArray[$i]);
				$listproduct->parse('MAIN.LISTMEMBER');
			}
		}
	$listproduct->parse('MAIN');
	$HTMLContent=$listproduct->text('MAIN');	
?>