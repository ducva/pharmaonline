<?php
class DB_DBASES {
	var $hostname;
	var $username;
	var $password;
	var $port;
	var $type;
	var $database;
	/*******************************************************************************/	
	function DB_DBASES($host="localhost", $user="root", $pass="123456", $port=3306, $type="mysql", $dbase="qtmonline") {
		$this->hostname = $host;
		$this->username = $user;
		$this->password = $pass;
		$this->port = $port;
		$this->type = $type;
		$this->database = $dbase;
	}
	/*******************************************************************************/
	function db_connect() {
		$checkConnect = false;
		switch ($this->type) {
			case "mysql":
				if (Empty($this->password)):
					$checkConnect = @mysql_connect($this->hostname, $this->username);
				else:
					$checkConnect = @mysql_connect($this->hostname, $this->username, $this->password);
				endif;
				break;
			case "mssql":
				if (Empty($this->password)):
					$checkConnect = @mssql_connect($this->hostname, $this->username);
				else:
					$checkConnect = @mssql_connect($this->hostname, $this->username, $this->password);
				endif;
				break;
			#case ...
		}

		if (!$checkConnect) {
			$this->db_display_error();
		}
		else {
			@mysql_select_db($this->database);
		}
		return $checkConnect;
	}
	/*******************************************************************************/
	function db_close()
	{
		return mysql_close();
	}
	/*******************************************************************************/
	function db_display_error() {
		print "Error: " . @mysql_error();
	}
	/*******************************************************************************/	
	function db_query($myStrSQL) {
		switch($this->type) {
			case "mysql":
				$result =  @mysql_query($myStrSQL);
				break;
			case "mssql":
				$result = @mssql_query($myStrSQL);
				break;
		}
		if  (!$result) {
			$this->db_display_error();	
		}
		return $result;
	}
	/*******************************************************************************/
	function db_fetch_array($result) {
		switch($this->type) {
			case "mysql":
				return @mysql_fetch_array($result);
				break;
			case "mssql":
				return @mssql_fetch_array($result);
				break;
		}
	}
	/*******************************************************************************/
	function db_num_rows($result) {
		switch($this->type) {
			case "mysql":
				return @mysql_num_rows($result);
				break;
			case "mssql":
				return @mssql_num_rows($result);
				break;
		}
	}

	/*******************************************************************************/
	function db_insert_id()
	{
		return @mysql_insert_id();
	}
	/*******************************************************************************/


}
?>