<?php
	ini_set('session.auto_start', 1);
	include_once 'dBug.php';
	$pubConnect = new DB_DBASES("localhost","root", "123456", 3306, "mysql","qtmonline");
	$pubConnect->db_connect();
?>