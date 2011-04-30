<?php	mysql_connect('localhost','root','');
	mysql_select_db('qtmgroup');
	$sql="select sum(Money) as Total, date_format(CreateDate,'%m') as m from order where m=1";
	echo $sql;
?>