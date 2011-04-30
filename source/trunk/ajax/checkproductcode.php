<?php	session_start();
	include "../include/xtpl.php";
	require("../include/function.php");
	//init
	include "../classdatabase/clsDatabase.php";
	include "../classdatabase/clstable.php";
	include "../include/publics.php";
	//end init
	if($_GET['code'] != "")
	{
		$sCode=strtoupper($_GET['code']);
	
		$oProduct=new clsTable('product');
		$aProduct=$oProduct->select("","","","Code='".$sCode."'");
		if(count($aProduct) > 0)
		{
			echo '<font style="font-family:arial;font-size:13px;"><b>Thông tin sản phẩm tìm được</b></font><BR>';
			echo '<table style="font-family:arial;font-size:12px;">
					<tr>
						<td>Tên sản phẩm: </td>
						<td><b>'.$aProduct[0]['Name'].'</b></td>
					</tr>
					<tr>
						<td>Mã sản phẩm: </td>
						<td><b>'.$aProduct[0]['Code'].'</b></td>
					</tr>
					<tr>
						<td valign="top">Ảnh: </td>
						<td valign="top" align="left"><img src="images/upload/product/thumbs/'.$aProduct[0]['Image'].'"></td>
					</tr>
					<tr>
						<td valign="top">Giá: </td>
						<td valign="top" align="left">'.sPriceFormat($aProduct[0]['PriceQTM']).'</td>
					</tr>
				  </table>';
	
			if($_SESSION['ProductCart'][$aProduct[0]['Id']] <= 1)
			{
				$_SESSION['ProductCart'][$aProduct[0]['Id']]=1;
			}
		}
		else
			echo '<font style="font-family:arial;font-size:12px;color:#ff0000">Không tìm thấy sản phẩm nào</font>';
	}
	else
		echo '<font style="font-family:arial;font-size:12px;">Bạn chưa nhập mã sản phẩm</font>';
?>