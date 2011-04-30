<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php	function MakeBackBone($iId)
	{
		if($iId > 0)
		{
			$oMember = new clsTable('member');
			$aMember = $oMember->select('', '', '', 'Id = '.$iId);
			$sBackBone = '<a href="?page=member&do=detail&id='.$iId.'" style="text-decoration: none;">&nbsp;'.$aMember[0]['Username'].'&nbsp;</a>';
			if($aMember[0]['RootId'] > 0)
			{
				$sBackBone = MakeBackBone($aMember[0]['RootId']).'->'.$sBackBone;
			}
			elseif($aMember[0]['RootId'] == 0)
			{
				$sBackBone = '<a href="?page=member&do=detail&id=0" style="text-decoration: none;">&nbsp;Admin&nbsp;</a>->'.$sBackBone;
			}
		}
		else 
		{
			$sBackBone = '';
		}
		return $sBackBone;
	}
	$detail=new XTemplate('html/modules/member/detail.tpl');
	$oMember = new clsMember($_GET['id'], $_SESSION['Date']);
	$aMember = $oMember->aVar;
	$aMember['Point'] = $oMember->iPoint;
	$aMember['TotalPoint'] = $oMember->iTotalPoint;
	$aMember['Percent'] = $oMember->iPercent;
	$aMember['Profit'] = $oMember->fProfit;
	$aMember['BACKBONE'] = MakeBackBone($oMember->aVar['Id']);
	$aMember['TREE'] = $oMember->sTree;
	$detail->assign('MAIN', $aMember);
	$detail->parse('MAIN');
	$HTMLContent=$detail->text('MAIN');	
?>