<?php
# code demo by www.phpbasic.com
# file dung` hien thi loai


$SERVER ="";
$USERNAME ="root";
$PASSWORD ="";
$DBNAME ="99kv2";
$update_time = 3;

$link  =mysql_connect($SERVER,$USERNAME,$PASSWORD);
if(!$link)
{
	die ("khong the ket noi duoc vao MYSQL SERVER");
}//end if

// chon CSDL de lam viec 
mysql_select_db ($DBNAME,$link);
//dong ket noi
//mysql_close($link);


$sTableName = $_GET['table'];
$sFieldName = $_GET['field'];
$sValue = $_GET['value'];
$sCboName = $_GET['cboname'];
print '<select name="'.$sCboName.'" style="width:150px;">';
$Sql = mysql_query("SELECT * FROM $sTableName WHERE $sFieldName='$sValue' ");
while($row = mysql_fetch_array($Sql))
{
echo "<option value='".$row[Id]."'>".$row[Name]."</option>" ;
}
//mysql_free_result($query_huyen);
print '</select>';
?>
