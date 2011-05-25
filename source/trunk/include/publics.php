<?php
	ini_set('session.auto_start', 'off');
	$pubConnect = new DB_DBASES("localhost","root", "123456", 3306, "mysql","qtmonline");
	$pubConnect->db_connect();
?>