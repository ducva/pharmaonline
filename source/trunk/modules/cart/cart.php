<?php	$oCart=new XTemplate('html/modules/cart/cart.tpl');
	
	$cart=new clsCart($_SESSION['ProductCart']);
	if($_SESSION['UserLogin']=="Y")
	{
		if(isset($_GET['do']))
		{
			$iProductId=$_GET['proid'];
			$sDo=$_GET['do'];
			switch($sDo)
			{
				case 'add':
						$_SESSION['ProductCart'][$iProductId]=1;
						$cart=new clsCart($_SESSION['ProductCart']);
						$sMessage="<script>window.location='index.php?page=cart&do=view';</script>";
						$oCart->assign('MESSAGE',$sMessage);
					break;
				case 'delete':
						unset($_SESSION['ProductCart'][$iProductId]);
						$sMessage="<script>window.location='index.php?page=cart&do=view';</script>";
						$oCart->assign('MESSAGE',$sMessage);
					break;
				case 'update':
						if(isset($_POST['hdnSumit']) && $_POST['hdnSumit']==1 && !empty($_SESSION['ProductCart']))
						{
							while(list($key,$value)=each($_SESSION['ProductCart']))
							{
								$_SESSION['ProductCart'][$key]=$_POST['txtQuantity_'.$key];
							}
						}
						$sMessage="<script>window.location='index.php?page=cart&do=view';</script>";
						$oCart->assign('MESSAGE',$sMessage);
					break;
				case 'view':
						$aArray=array();
						$iSPT=0;
						$aArray=$cart->aGetProduct();
						$iLine=count($aArray);
						if($iLine > 0)
						{
							for($i=0;$i<$iLine;$i++)
							{
								$iSPT++;
								$oCart->assign('LISTPRODUCT',$aArray[$i]);
								$oCart->parse('MAIN.LISTPRODUCT');
							}
							$oCart->assign('TOTALMONEY',sPriceFormat($cart->iGetTotalMoney()));
						}
						else
							$oCart->parse('MAIN.NOPRODUCT');
							
						//time
						for($i=0 ; $i<24 ; $i++)
						{
							$aArray=array('VALUE'=>$i,'NAME'=>$i."h");
							$oCart->assign('CBOHOUR',$aArray);
							$oCart->parse('MAIN.CBOHOUR');
						}
						//end time
						//day
						$iCurrentDay=date('d');
						for($i=1 ; $i<=31 ; $i++)
						{
							if($i==$iCurrentDay)
								$sSelected='selected';
							else 
								$sSelected='';
							$aArray=array('VALUE'=>$i,'NAME'=>$i,'SELECTED'=>$sSelected);
							$oCart->assign('CBODAY',$aArray);
							$oCart->parse('MAIN.CBODAY');
						}
						//end day
						//month
						$iCurrentMonth=date('m');
						for($i=1 ; $i<=12 ; $i++)
						{
							if($i==$iCurrentMonth)
								$sSelected='selected';
							else 
								$sSelected='';
							$aArray=array('VALUE'=>$i,'NAME'=>$i,'SELECTED'=>$sSelected);
							$oCart->assign('CBOMONTH',$aArray);
							$oCart->parse('MAIN.CBOMONTH');
						}
						//end month
						//year
						$iCurrentYear=date('Y');
						for($i=$iCurrentYear ; $i<=$iCurrentYear+3 ; $i++)
						{
							if($i==$iCurrentYear)
								$sSelected='selected';
							else 
								$sSelected='';
							$aArray=array('VALUE'=>$i,'NAME'=>$i,'SELECTED'=>$sSelected);
							$oCart->assign('CBOYEAR',$aArray);
							$oCart->parse('MAIN.CBOYEAR');
						}
						//end year
					break;
				case 'order':
						if(count($_SESSION['ProductCart'])==0)
						{
							$sMessage="<script>alert('Bạn chưa chọn sản phẩm nào!');window.location='index.php?page=cart&do=view';</script>";
							$oCart->assign('MESSAGE',$sMessage);
						}
						else 
						{
							//insert vao bang orders va ordersdetail
							$oOrdersDetail=new clsTable('ordersdetail');
							$oOrders=new clsTable('orders');
							$cart=new clsCart($_SESSION['ProductCart']);
							//echo $cart->iTotalMoney;
							$iMoney=$cart->iGetTotalMoney();
							$iUserId=$_SESSION['UserId'];
							$iStatus=0;
							
							$iOrdersId=$oOrders->firstblank();
							
							$sAddress=$_GET['address'];
							
							$aArray=array(
										'Status'=>$iStatus,
										'Money'=>$iMoney,
										'memberId'=>$iUserId,
										'Address'=>$sAddress
										);
							$oOrders=new clsOrders($aArray);
							
							while(list($key,$value)=each($_SESSION['ProductCart']))
							{
								//increase order
								$oProduct=new clsTable('product');
								$aProduct=$oProduct->select('','','','Id='.$key);
								$iNumberOrder=$aProduct[0]['Orders'];
								$iNumberOrder++;
								$oProduct->update("Orders='".$iNumberOrder."'","Id=".$key);
								
								//end increase order
								$oOrdersDetail->insert("productId,Quantity,ordersId","'".$key."','".$value."','".$iOrdersId."'");
							}
							//end insert vao baong orders va ordersdetail
							
							unset($_SESSION['ProductCart']);
							$sMessage="<script>alert('Đơn đặt hàng của bạn đã được gửi đến chúng tôi!');window.location='index.php?page=cart&do=view';</script>";
							$oCart->assign('MESSAGE',$sMessage);
						}
					break;
				default:
					$sMessage="<script>window.location='index.php?page=cart&do=view';</script>";
					$oCart->assign('MESSAGE',$sMessage);
			}
		}
	}
	else
	{
		$sMessage="<script>alert('Bạn cần phải đăng nhập thì mới có thể sử dụng chức năng mua hàng!!');window.location='index.php';</script>";
		$oCart->assign('MESSAGE',$sMessage);
	}
	$oCart->parse('MAIN');
	$HTMLContent=$oCart->text('MAIN');
?>