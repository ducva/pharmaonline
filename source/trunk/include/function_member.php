<?php	function iTotalPoint($iRootId='0', $iPoint='0') 
	{
		global $iTotal; 
		$oMember=new clsTable('member');
		$aMember=$oMember->select('','','','RootId='.$iRootId);
		$iLine=count($aMember);
		if($iLine > 0)
		{
			for($i=0;$i<$iLine;$i++)
			{
				$iTotal+=$aMember[$i]['Point'];
				iTotalPoint($aMember[$i]['Id'],$aMember[$i]['Point']);
			}
		}
		return $iTotal + $iPoint;
	} 
?>
