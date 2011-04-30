<?php
/*====================================*\
|| ################################## ||
|| # MYSQL LOGIN                  	# ||
|| # ------------------------------	# ||
|| # De Code by zik			    # ||
|| # Y!m : zik					# ||
|| # website:www.viethacker.org		# ||
|| ################################## ||
\*====================================*/
// Path and URL to files wrong
define('PATH', 'backup/');
define('URL',  'backup/');
// Maximum runtime seconds
// 0 - No limitations
define('TIME_LIMIT', 600);
// Limiting the amount of data dostavaemyh one treatment to DB (in megabytes)
// It is to limit the number of memory pozhiraemoy server stack with a very large tables
define('LIMIT', 1);
// mysql server
define('DBHOST', 'localhost:3306');
// Databases, if the server does not allow browse the list of databases,
// and nothing shows up after authorization. List the names with a comma 
define('DBNAMES', '');
// Encoding connections to MySQL
// auto-automatic (a coding table), cp1251-windows-1251, etc.
define('CHARSET', 'auto');
// Encoding connections to MySQL recovery
// If a transfer from old versions of MySQL (up to 4.1), which is not specified encoding tables in the dump
// Adding 'forced->', for example 'forced-> cp1251', encoding tables in the reconstruction will be forcibly replaced by cp1251
// You can also specify comparison of the right to suit 'cp1251_ukrainian_ci' or 'forced-> cp1251_ukrainian_ci'
define('RESTORE_CHARSET', 'latin1');
// Include your persistence and the latest action
// To turn set 0
define('SC', 1);
// Types tables have been maintained only structure separated semicolon
define('ONLY_CREATE', 'MRG_MyISAM,MERGE,HEAP,MEMORY');
// Global statistics
// To turn set 0
define('GS', 1);


// Forward does not need editing

$is_safe_mode = ini_get('safe_mode') == '1' ? 1 : 0;
if (!$is_safe_mode && function_exists('set_time_limit')) set_time_limit(TIME_LIMIT);



$timer = array_sum(explode(' ', microtime()));
ob_implicit_flush();
error_reporting(E_ALL);

$auth = 0;
$error = '';
if (!empty($_POST['login']) && isset($_POST['pass'])) {
	if (@mysql_connect(DBHOST, $_POST['login'], $_POST['pass'])){
		setcookie("sxd", base64_encode("SKD101:{$_POST['login']}:{$_POST['pass']}"));
		header("Location: ".$_SERVER['PHP_SELF']);
		mysql_close();
		exit;
	}
	else{
		$error = '#' . mysql_errno() . ': ' . mysql_error();
	}
}
elseif (!empty($_COOKIE['sxd'])) {
    $user = explode(":", base64_decode($_COOKIE['sxd']));
	if (@mysql_connect(DBHOST, $user[1], $user[2])){
		$auth = 1;
	}
	else{
		$error = '#' . mysql_errno() . ': ' . mysql_error();
	}
}

if (!$auth || (isset($_SERVER['QUERY_STRING']) && $_SERVER['QUERY_STRING'] == 'reload')) {
	
	echo tpl_page(tpl_auth($error ? tpl_error($error) : ''), "<SCRIPT>if (jsEnabled) {document.write('<INPUT TYPE=submit VALUE=Login>');}</SCRIPT>");
	echo "<SCRIPT>document.getElementById('timer').innerHTML = '" . round(array_sum(explode(' ', microtime())) - $timer, 4) . " sec.'</SCRIPT>";
	exit;
}
if (!file_exists(PATH) && !$is_safe_mode) {
    mkdir(PATH, 0777) || trigger_error("Unable to create a directory for printer ", E_USER_ERROR);
}

$SK = new dumper();
define('C_DEFAULT', 1);
define('C_RESULT', 2);
define('C_ERROR', 3);
define('C_WARNING', 4);

$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';
switch($action){
	case 'backup':
		$SK->backup();
		break;
	case 'restore':
		$SK->restore();
		break;
	default:
		$SK->main();
}

mysql_close();

echo "<SCRIPT>document.getElementById('timer').innerHTML = '" . round(array_sum(explode(' ', microtime())) - $timer, 4) . " sec.'</SCRIPT>";

class dumper {
	function dumper() {
		if (file_exists(PATH . "dumper.cfg.php")) {
		    include(PATH . "dumper.cfg.php");
		}
		else{
			$this->SET['last_action'] = 0;
			$this->SET['last_db_backup'] = '';
			$this->SET['tables'] = '';
			$this->SET['comp_method'] = 2;
			$this->SET['comp_level']  = 7;
			$this->SET['last_db_restore'] = '';
		}
		$this->tabs = 0;
		$this->records = 0;
		$this->size = 0;
		$this->comp = 0;

		// MySQL type 40101
		preg_match("/^(\d+)\.(\d+)\.(\d+)/", mysql_get_server_info(), $m);
		$this->mysql_version = sprintf("%d%02d%02d", $m[1], $m[2], $m[3]);

		$this->only_create = explode(',', ONLY_CREATE);
		$this->forced_charset  = false;
		$this->restore_charset = $this->restore_collate = '';
		if (preg_match("/^(forced->)?(([a-z0-9]+)(\_\w+)?)$/", RESTORE_CHARSET, $matches)) {
			$this->forced_charset  = $matches[1] == 'forced->';
			$this->restore_charset = $matches[3];
			$this->restore_collate = !empty($matches[4]) ? ' COLLATE ' . $matches[2] : '';
		}
	}

	function backup() {
		if (!isset($_POST)) {$this->main();}
		set_error_handler("SXD_errorHandler");
		$buttons = "<A ID=save HREF='' STYLE='display: none;'>Download File</A> &nbsp; <INPUT ID=back TYPE=button VALUE='Tr&#7903; V&#7873;' DISABLED onClick=\"history.back();\">";
		echo tpl_page(tpl_process("Xin vui l&ograve;ng ch&#7901; &#273;&#7907;i trong gi&acirc;y l&aacute;t... "), $buttons);

		$this->SET['last_action']     = 0;
		$this->SET['last_db_backup']  = isset($_POST['db_backup']) ? $_POST['db_backup'] : '';
		$this->SET['tables_exclude']  = !empty($_POST['tables']) && $_POST['tables']{0} == '^' ? 1 : 0;
		$this->SET['tables']          = isset($_POST['tables']) ? $_POST['tables'] : '';
		$this->SET['comp_method']     = isset($_POST['comp_method']) ? intval($_POST['comp_method']) : 0;
		$this->SET['comp_level']      = isset($_POST['comp_level']) ? intval($_POST['comp_level']) : 0;
		$this->fn_save();

		$this->SET['tables']          = explode(",", $this->SET['tables']);
		if (!empty($_POST['tables'])) {
		    foreach($this->SET['tables'] AS $table){
    			$table = preg_replace("/[^\w*?^]/", "", $table);
				$pattern = array( "/\?/", "/\*/");
				$replace = array( ".", ".*?");
				$tbls[] = preg_replace($pattern, $replace, $table);
    		}
		}
		else{
			$this->SET['tables_exclude'] = 1;
		}

		if ($this->SET['comp_level'] == 0) {
		    $this->SET['comp_method'] = 0;
		}
		$db = $this->SET['last_db_backup'];

		if (!$db) {
			echo tpl_l("ERROR! No database!", C_ERROR);
			echo tpl_enableBack();
		    exit;
		}
		echo tpl_l("&#272;ang k&#7871;t n&#7889;i c&#417; s&#7903; d&#7919; li&#7879;u.");
		mysql_select_db($db) or trigger_error ("Unable to select database.<BR>" . mysql_error(), E_USER_ERROR);
		$tables = array();
        $result = mysql_query("SHOW TABLES");
		$all = 0;
        while($row = mysql_fetch_array($result)) {
			$status = 0;
			if (!empty($tbls)) {
			    foreach($tbls AS $table){
    				$exclude = preg_match("/^\^/", $table) ? true : false;
    				if (!$exclude) {
    					if (preg_match("/^{$table}$/i", $row[0])) {
    					    $status = 1;
    					}
    					$all = 1;
    				}
    				if ($exclude && preg_match("/{$table}$/i", $row[0])) {
    				    $status = -1;
    				}
    			}
			}
			else {
				$status = 1;
			}
			if ($status >= $all) {
    			$tables[] = $row[0];
    		}
        }

		$tabs = count($tables);
		// Determination of tables
		$result = mysql_query("SHOW TABLE STATUS");
		$tabinfo = array();
		$tab_charset = array();
		$tab_type = array();
		$tabinfo[0] = 0;
		$info = '';
		while($item = mysql_fetch_assoc($result)){
			//print_r($item);
			if(in_array($item['Name'], $tables)) {
				$item['Rows'] = empty($item['Rows']) ? 0 : $item['Rows'];
				$tabinfo[0] += $item['Rows'];
				$tabinfo[$item['Name']] = $item['Rows'];
				$this->size += $item['Data_length'];
				$tabsize[$item['Name']] = 1 + round(LIMIT * 1048576 / ($item['Avg_row_length'] + 1));
				if($item['Rows']) $info .= "|" . $item['Rows'];
				if (!empty($item['Collation']) && preg_match("/^([a-z0-9]+)_/i", $item['Collation'], $m)) {
					$tab_charset[$item['Name']] = $m[1];
				}
				$tab_type[$item['Name']] = isset($item['Engine']) ? $item['Engine'] : $item['Type'];
			}
		}
		$show = 10 + $tabinfo[0] / 50;
		$info = $tabinfo[0] . $info;
		$name = $db . '_' . date("Y-m-d_H-i");
        $fp = $this->fn_open($name, "w");
		echo tpl_l("B&#7855;t &#273;&#7847;u t&#7841;o t&ecirc;n c&#417; s&#7903; d&#7919; li&#7879;u :<BR>\\n  -  {$this->filename}");
		$this->fn_write($fp, "#SKD101|{$db}|{$tabs}|" . date("Y.m.d H:i:s") ."|{$info}\n\n");
		$t=0;
		echo tpl_l(str_repeat("-", 60));
		$result = mysql_query("SET SQL_QUOTE_SHOW_CREATE = 1");
		// Encoding connections by default
		if ($this->mysql_version > 40101 && CHARSET != 'auto') {
			mysql_query("SET NAMES '" . CHARSET . "'") or trigger_error ("Cannot set the encoding for the connection.<BR>" . mysql_error(), E_USER_ERROR);
			$last_charset = CHARSET;
		}
		else{
			$last_charset = '';
		}
        foreach ($tables AS $table){
			// Bill encoding connecting the encoding tables
			if ($this->mysql_version > 40101 && $tab_charset[$table] != $last_charset) {
				if (CHARSET == 'auto') {
					mysql_query("SET NAMES '" . $tab_charset[$table] . "'") or trigger_error ("Cannot set the encoding for the connection.<BR>" . mysql_error(), E_USER_ERROR);
					echo tpl_l("Using encoding `" . $tab_charset[$table] . "`.", C_WARNING);
					$last_charset = $tab_charset[$table];
				}
				else{
					echo tpl_l('Encoding connections, and the table does not match:', C_ERROR);
					echo tpl_l('Table  `'. $table .'` -> ' . $tab_charset[$table] . ' (Connection  '  . CHARSET . ')', C_ERROR);
				}
			}
			echo tpl_l("Processing Table`{$table}` [" . fn_int($tabinfo[$table]) . "].");
        	// Creating tables 
			$result = mysql_query("SHOW CREATE TABLE `{$table}`");
        	$tab = mysql_fetch_array($result);
			$tab = preg_replace('/(default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP|DEFAULT CHARSET=\w+|COLLATE=\w+|character set \w+|collate \w+)/i', '/*!40101 \\1 */', $tab);
        	$this->fn_write($fp, "DROP TABLE IF EXISTS `{$table}`;\n{$tab[1]};\n\n");
        	// Checking whether dampit data
        	if (in_array($tab_type[$table], $this->only_create)) {
				continue;
			}
        	// Oprededelyaem types of columns
            $NumericColumn = array();
            $result = mysql_query("SHOW COLUMNS FROM `{$table}`");
            $field = 0;
            while($col = mysql_fetch_row($result)) {
            	$NumericColumn[$field++] = preg_match("/^(\w*int|year)/", $col[1]) ? 1 : 0;
            }
			$fields = $field;
            $from = 0;
			$limit = $tabsize[$table];
			$limit2 = round($limit / 3);
			if ($tabinfo[$table] > 0) {
			if ($tabinfo[$table] > $limit2) {
			    echo tpl_s(0, $t / $tabinfo[0]);
			}
			$i = 0;
			$this->fn_write($fp, "INSERT INTO `{$table}` VALUES");
            while(($result = mysql_query("SELECT * FROM `{$table}` LIMIT {$from}, {$limit}")) && ($total = mysql_num_rows($result))){
            		while($row = mysql_fetch_row($result)) {
                    	$i++;
    					$t++;

						for($k = 0; $k < $fields; $k++){
                    		if ($NumericColumn[$k])
                    		    $row[$k] = isset($row[$k]) ? $row[$k] : "NULL";
                    		else
                    			$row[$k] = isset($row[$k]) ? "'" . mysql_escape_string($row[$k]) . "'" : "NULL";
                    	}

    					$this->fn_write($fp, ($i == 1 ? "" : ",") . "\n(" . implode(", ", $row) . ")");
    					if ($i % $limit2 == 0)
    						echo tpl_s($i / $tabinfo[$table], $t / $tabinfo[0]);
               		}
					mysql_free_result($result);
					if ($total < $limit) {
					    break;
					}
    				$from += $limit;
            }

			$this->fn_write($fp, ";\n\n");
    		echo tpl_s(1, $t / $tabinfo[0]);}
		}
		$this->tabs = $tabs;
		$this->records = $tabinfo[0];
		$this->comp = $this->SET['comp_method'] * 10 + $this->SET['comp_level'];
        echo tpl_s(1, 1);
        echo tpl_l(str_repeat("-", 60));
        $this->fn_close($fp);
		echo tpl_l("<b>Qu&aacute; tr&igrave;nh x&#7917; l&yacute; c&#417; s&#7903; d&#7919; li&#7879;u `{$db}` &#273;&atilde; th&agrave;nh c&ocirc;ng.</b>", C_RESULT);
		echo tpl_l("Size of DB : " . round($this->size / 1048576, 2) . ".", C_RESULT);
		$filesize = round(filesize(PATH . $this->filename) / 1048576, 2) . ".";
		echo tpl_l("Size of file : {$filesize}", C_RESULT);
		echo tpl_l("Tables processed : {$tabs}", C_RESULT);
		echo tpl_l("Lines processed :   " . fn_int($tabinfo[0]), C_RESULT);
		echo "<SCRIPT>with (document.getElementById('save')) {style.display = ''; innerHTML = '<font color=red>T&#7843;i c&#417; s&#7903; d&#7919; li&#7879;u v&#7873; m&aacute;y</font> ({$filesize})'; href = '" . URL . $this->filename . "'; }document.getElementById('back').disabled = 0;</SCRIPT>";
		// Data Transfer for global statistics 
		if (GS) echo "<SCRIPT>document.getElementById('GS').src = 'http://sypex.net/gs.php?b={$this->tabs},{$this->records},{$this->size},{$this->comp},108';</SCRIPT>";

	}

	function restore(){
		if (!isset($_POST)) {$this->main();}
		set_error_handler("SXD_errorHandler");
		$buttons = "<INPUT ID=back TYPE=button VALUE='Back' DISABLED onClick=\"history.back();\">";
		echo tpl_page(tpl_process("Restoring database backup"), $buttons);

		$this->SET['last_action']     = 1;
		$this->SET['last_db_restore'] = isset($_POST['db_restore']) ? $_POST['db_restore'] : '';
		$file						  = isset($_POST['file']) ? $_POST['file'] : '';
		$this->fn_save();
		$db = $this->SET['last_db_restore'];

		if (!$db) {
			echo tpl_l("ERROR! No database!", C_ERROR);
			echo tpl_enableBack();
		    exit;
		}
		echo tpl_l("&#272;ang k&#7871;t n&#7889;i c&#417; s&#7903; d&#7919; li&#7879;u `{$db}`.");
		mysql_select_db($db) or trigger_error ("Unable to select database. .<BR>" . mysql_error(), E_USER_ERROR);

		// Definition file format
		if(preg_match("/^(.+?)\.sql(\.(bz2|gz))?$/", $file, $matches)) {
			if (isset($matches[3]) && $matches[3] == 'bz2') {
			    $this->SET['comp_method'] = 2;
			}
			elseif (isset($matches[2]) &&$matches[3] == 'gz'){
				$this->SET['comp_method'] = 1;
			}
			else{
				$this->SET['comp_method'] = 0;
			}
			$this->SET['comp_level'] = '';
			if (!file_exists(PATH . "/{$file}")) {
    		    echo tpl_l("ERROR! File Not Found! !", C_ERROR);
				echo tpl_enableBack();
    		    exit;
    		}
			echo tpl_l("Reading File`{$file}`.");
			$file = $matches[1];
		}
		else{
			echo tpl_l("ERROR! No file selected(", C_ERROR);
			echo tpl_enableBack();
		    exit;
		}
		echo tpl_l(str_repeat("-", 60));
		$fp = $this->fn_open($file, "r");
		$this->file_cache = $sql = $table = $insert = '';
        $is_skd = $query_len = $execute = $q =$t = $i = $aff_rows = 0;
		$limit = 300;
        $index = 4;
		$tabs = 0;
		$cache = '';
		$info = array();

		// Setting coding connections
		if ($this->mysql_version > 40101 && (CHARSET != 'auto' || $this->forced_charset)) { // Encryption by default if the dump was not encoded
			mysql_query("SET NAMES '" . $this->restore_charset . "'") or trigger_error ("Cannot set the encoding for the connection.<BR>" . mysql_error(), E_USER_ERROR);
			echo tpl_l("Using encoding `" . $this->restore_charset . "`.", C_WARNING);
			$last_charset = $this->restore_charset;
		}
		else {
			$last_charset = '';
		}
		$last_showed = '';
		while(($str = $this->fn_read_str($fp)) !== false){
			if (empty($str) || preg_match("/^(#|--)/", $str)) {
				if (!$is_skd && preg_match("/^#SKD101\|/", $str)) {
				    $info = explode("|", $str);
					echo tpl_s(0, $t / $info[4]);
					$is_skd = 1;
				}
        	    continue;
        	}
			$query_len += strlen($str);

			if (!$insert && preg_match("/^(INSERT INTO `?([^` ]+)`? .*?VALUES)(.*)$/i", $str, $m)) {
				if ($table != $m[2]) {
				    $table = $m[2];
					$tabs++;
					$cache .= tpl_l("Table `{$table}`.");
					$last_showed = $table;
					$i = 0;
					if ($is_skd)
					    echo tpl_s(100 , $t / $info[4]);
				}
        	    $insert = $m[1] . ' ';
				$sql .= $m[3];
				$index++;
				$info[$index] = isset($info[$index]) ? $info[$index] : 0;
				$limit = round($info[$index] / 20);
				$limit = $limit < 300 ? 300 : $limit;
				if ($info[$index] > $limit){
					echo $cache;
					$cache = '';
					echo tpl_s(0 / $info[$index], $t / $info[4]);
				}
        	}
			else{
        		$sql .= $str;
				if ($insert) {
				    $i++;
    				$t++;
    				if ($is_skd && $info[$index] > $limit && $t % $limit == 0){
    					echo tpl_s($i / $info[$index], $t / $info[4]);
    				}
				}
        	}

			if (!$insert && preg_match("/^CREATE TABLE (IF NOT EXISTS )?`?([^` ]+)`?/i", $str, $m) && $table != $m[2]){
				$table = $m[2];
				$insert = '';
				$tabs++;
				$is_create = true;
				$i = 0;
			}
			if ($sql) {
			    if (preg_match("/;$/", $str)) {
            		$sql = rtrim($insert . $sql, ";");
					if (empty($insert)) {
						if ($this->mysql_version < 40101) {
				    		$sql = preg_replace("/ENGINE\s?=/", "TYPE=", $sql);
						}
						elseif (preg_match("/CREATE TABLE/i", $sql)){
							// Bill encoding connections
							if (preg_match("/(CHARACTER SET|CHARSET)[=\s]+(\w+)/i", $sql, $charset)) {
								if (!$this->forced_charset && $charset[2] != $last_charset) {
									if (CHARSET == 'auto') {
										mysql_query("SET NAMES '" . $charset[2] . "'") or trigger_error ("Cannot set the encoding for the connection.<BR>{$sql}<BR>" . mysql_error(), E_USER_ERROR);
										$cache .= tpl_l("Using encoding `" . $charset[2] . "`.", C_WARNING);
										$last_charset = $charset[2];
									}
									else{
										$cache .= tpl_l('Encoding connections, and the table does not match :', C_ERROR);
										$cache .= tpl_l('Table `'. $table .'` -> ' . $charset[2] . ' (Connection '  . $this->restore_charset . ')', C_ERROR);
									}
								}
								// Changing encoding if the rush encoding
								if ($this->forced_charset) {
									$sql = preg_replace("/(\/\*!\d+\s)?((COLLATE)[=\s]+)\w+(\s+\*\/)?/i", '', $sql);
									$sql = preg_replace("/((CHARACTER SET|CHARSET)[=\s]+)\w+/i", "\\1" . $this->restore_charset . $this->restore_collate, $sql);
								}
							}
							elseif(CHARSET == 'auto'){ // Run encoding table if it is not specified and installed auto encoding
								$sql .= ' DEFAULT CHARSET=' . $this->restore_charset . $this->restore_collate;
								if ($this->restore_charset != $last_charset) {
									mysql_query("SET NAMES '" . $this->restore_charset . "'") or trigger_error ("Cannot set the encoding for the connection.<BR>{$sql}<BR>" . mysql_error(), E_USER_ERROR);
									$cache .= tpl_l("Using encoding `" . $this->restore_charset . "`.", C_WARNING);
									$last_charset = $this->restore_charset;
								}
							}
						}
						if ($last_showed != $table) {$cache .= tpl_l("Table `{$table}`."); $last_showed = $table;}
					}
					elseif($this->mysql_version > 40101 && empty($last_charset)) { // Install encoding for the absence CREATE TABLE
						mysql_query("SET $this->restore_charset '" . $this->restore_charset . "'") or trigger_error ("Cannot set the encoding for the connection.<BR>{$sql}<BR>" . mysql_error(), E_USER_ERROR);
						echo tpl_l("Using encoding `" . $this->restore_charset . "`.", C_WARNING);
						$last_charset = $this->restore_charset;
					}
            		$insert = '';
            	    $execute = 1;
            	}
            	if ($query_len >= 65536 && preg_match("/,$/", $str)) {
            		$sql = rtrim($insert . $sql, ",");
            	    $execute = 1;
            	}
    			if ($execute) {
            		$q++;
            		mysql_query($sql) or trigger_error ("Bad request.<BR>" . mysql_error(), E_USER_ERROR);
					if (preg_match("/^insert/i", $sql)) {
            		    $aff_rows += mysql_affected_rows();
            		}
            		$sql = '';
            		$query_len = 0;
            		$execute = 0;
            	}
			}
		}
		echo $cache;
		echo tpl_s(1 , 1);
		echo tpl_l(str_repeat("-", 60));
		echo tpl_l("DB restored from a backup.", C_RESULT);
		if (isset($info[3])) echo tpl_l("Established copies: {$info[3]}", C_RESULT);
		echo tpl_l("Queries to DB: {$q}", C_RESULT);
		echo tpl_l("Tables set up: {$tabs}", C_RESULT);
		echo tpl_l("Lines added: {$aff_rows}", C_RESULT);

		$this->tabs = $tabs;
		$this->records = $aff_rows;
		$this->size = filesize(PATH . $this->filename);
		$this->comp = $this->SET['comp_method'] * 10 + $this->SET['comp_level'];
		echo "<SCRIPT>document.getElementById('back').disabled = 0;</SCRIPT>";
		// Data Transfer for global statistics
		if (GS) echo "<SCRIPT>document.getElementById('GS').src = 'http://sypex.net/gs.php?r={$this->tabs},{$this->records},{$this->size},{$this->comp},108';</SCRIPT>";

		$this->fn_close($fp);
	}

	function main(){
		$this->comp_levels = array('9' => 'Level 9 (Cao nh&#7845;t)', '8' => 'Level 8', '7' => 'Level 7', '6' => 'Level 6', '5' => 'Level 5 (Trung b&igrave;nh)', '4' => 'Level 4', '3' => 'Level 3', '2' => 'Level 2', '1' => 'Level 1 (B&igrave;nh th&#432;&#7901;ng)','0' => 'Kh&ocirc;ng t&#7889;i &#432;u h&oacute;a ');

		if (function_exists("bzopen")) {
		    $this->comp_methods[2] = 'BZip2';
		}
		if (function_exists("gzopen")) {
		    $this->comp_methods[1] = 'GZip';
		}
		$this->comp_methods[0] = 'No compression';
		if (count($this->comp_methods) == 1) {
		    $this->comp_levels = array('0' =>'No compression');
		}

		$dbs = $this->db_select();
		$this->vars['db_backup']    = $this->fn_select($dbs, $this->SET['last_db_backup']);
		$this->vars['db_restore']   = $this->fn_select($dbs, $this->SET['last_db_restore']);
		$this->vars['comp_levels']  = $this->fn_select($this->comp_levels, $this->SET['comp_level']);
		$this->vars['comp_methods'] = $this->fn_select($this->comp_methods, $this->SET['comp_method']);
		$this->vars['tables']       = $this->SET['tables'];
		$this->vars['files']        = $this->fn_select($this->file_select(), '');
		$buttons = "<INPUT TYPE=submit VALUE=Okie><INPUT TYPE=button VALUE='Tho&aacute;t' onClick=\"location.href = '".$_SERVER['PHP_SELF']."?reload'\">";
		echo tpl_page(tpl_main(), $buttons);
	}

	function db_select(){
		if (DBNAMES != '') {
			$items = explode(',', trim(DBNAMES));
			foreach($items AS $item){
    			if (mysql_select_db($item)) {
    				$tables = mysql_query("SHOW TABLES");
    				if ($tables) {
    	  			    $tabs = mysql_num_rows($tables);
    	  				$dbs[$item] = "{$item} ({$tabs})";
    	  			}
    			}
			}
		}
		else {
    		$result = mysql_query("SHOW DATABASES");
    		$dbs = array();
    		while($item = mysql_fetch_array($result)){
    			if (mysql_select_db($item[0])) {
    				$tables = mysql_query("SHOW TABLES");
    				if ($tables) {
    	  			    $tabs = mysql_num_rows($tables);
    	  				$dbs[$item[0]] = "{$item[0]} ({$tabs})";
    	  			}
    			}
    		}
		}
	    return $dbs;
	}

	function file_select(){
		$files = array('' => ' ');
		if (is_dir(PATH) && $handle = opendir(PATH)) {
            while (false !== ($file = readdir($handle))) {
                if (preg_match("/^.+?\.sql(\.(gz|bz2))?$/", $file)) {
                    $files[$file] = $file;
                }
            }
            closedir($handle);
        }
        ksort($files);
		return $files;
	}

	function fn_open($name, $mode){
		if ($this->SET['comp_method'] == 2) {
			$this->filename = "{$name}.sql.bz2";
		    return bzopen(PATH . $this->filename, "{$mode}b{$this->SET['comp_level']}");
		}
		elseif ($this->SET['comp_method'] == 1) {
			$this->filename = "{$name}.sql.gz";
		    return gzopen(PATH . $this->filename, "{$mode}b{$this->SET['comp_level']}");
		}
		else{
			$this->filename = "{$name}.sql";
			return fopen(PATH . $this->filename, "{$mode}b");
		}
	}

	function fn_write($fp, $str){
		if ($this->SET['comp_method'] == 2) {
		    bzwrite($fp, $str);
		}
		elseif ($this->SET['comp_method'] == 1) {
		    gzwrite($fp, $str);
		}
		else{
			fwrite($fp, $str);
		}
	}

	function fn_read($fp){
		if ($this->SET['comp_method'] == 2) {
		    return bzread($fp, 4096);
		}
		elseif ($this->SET['comp_method'] == 1) {
		    return gzread($fp, 4096);
		}
		else{
			return fread($fp, 4096);
		}
	}

	function fn_read_str($fp){
		$string = '';
		$this->file_cache = ltrim($this->file_cache);
		$pos = strpos($this->file_cache, "\n", 0);
		if ($pos < 1) {
			while (!$string && ($str = $this->fn_read($fp))){
    			$pos = strpos($str, "\n", 0);
    			if ($pos === false) {
    			    $this->file_cache .= $str;
    			}
    			else{
    				$string = $this->file_cache . substr($str, 0, $pos);
    				$this->file_cache = substr($str, $pos + 1);
    			}
    		}
			if (!$str) {
			    if ($this->file_cache) {
					$string = $this->file_cache;
					$this->file_cache = '';
				    return trim($string);
				}
			    return false;
			}
		}
		else {
  			$string = substr($this->file_cache, 0, $pos);
  			$this->file_cache = substr($this->file_cache, $pos + 1);
		}
		return trim($string);
	}

	function fn_close($fp){
		if ($this->SET['comp_method'] == 2) {
		    bzclose($fp);
		}
		elseif ($this->SET['comp_method'] == 1) {
		    gzclose($fp);
		}
		else{
			fclose($fp);
		}
		@chmod(PATH . $this->filename, 0666);
		$this->fn_index();
	}

	function fn_select($items, $selected){
		$select = '';
		foreach($items AS $key => $value){
			$select .= $key == $selected ? "<OPTION VALUE='{$key}' SELECTED>{$value}" : "<OPTION VALUE='{$key}'>{$value}";
		}
		return $select;
	}

	function fn_save(){
		if (SC) {
			$ne = !file_exists(PATH . "dumper.cfg.php");
		    $fp = fopen(PATH . "dumper.cfg.php", "wb");
        	fwrite($fp, "<?php\n\$this->SET = " . fn_arr2str($this->SET) . "\n?>");
        	fclose($fp);
			if ($ne) @chmod(PATH . "dumper.cfg.php", 0666);
			$this->fn_index();
		}
	}

	function fn_index(){
		if (!file_exists(PATH . 'index.html')) {
		    $fh = fopen(PATH . 'index.html', 'wb');
			fwrite($fh, tpl_backup_index());
			fclose($fh);
			@chmod(PATH . 'index.html', 0666);
		}
	}
}

function fn_int($num){
	return number_format($num, 0, ',', ' ');
}

function fn_arr2str($array) {
	$str = "array(\n";
	foreach ($array as $key => $value) {
		if (is_array($value)) {
			$str .= "'$key' => " . fn_arr2str($value) . ",\n\n";
		}
		else {
			$str .= "'$key' => '" . str_replace("'", "\'", $value) . "',\n";
		}
	}
	return $str . ")";
}

// Templates 

function tpl_page($content = '', $buttons = ''){
return <<<HTML
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>

<META HTTP-EQUIV=Content-Type CONTENT="text/html; charset=windows-1251">
<STYLE TYPE="TEXT/CSS">
<!--
body{
	overflow: auto;
	color: #4D4D4D;
	scrollbar-arrow-color: #C6C6C6;
	scrollbar-face-color: #FFF; 
	scrollbar-track-color: #FFF; 
	scrollbar-highlight-color: #C6C6C6; 
	scrollbar-shadow-color: #C6C6C6; 
	scrollbar-darkshadow-color: #FFF;
	scrollbar-3dlight-color: #FFF;
	Cursor: default;
	/*background: #54554F;*/
	background-image: url("img/background-center.gif");
	background-position:center;
	background-repeat:repeat-y;
	margin: 0;
	font-family: tahoma, verdana, arial, sans-serif;	
	font-size: 11px;
}
td {
	font: 11px tahoma, verdana, arial;
	cursor: default;
}
input, select, div {
	font: 11px tahoma, verdana, arial;
}
input.text, select {
	width: 100%;
}
fieldset {
	margin-bottom: 20px;
}
-->
</STYLE>
</HEAD>

<BODY BGCOLOR=#333333 TEXT=#000000>
<TABLE WIDTH=100% HEIGHT=100% BORDER=0 CELLSPACING=0 CELLPADDING=0 ALIGN=CENTER>
<TR>
<TD HEIGHT=60% ALIGN=CENTER VALIGN=MIDDLE>
<TABLE WIDTH=360 BORDER=0 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=TOP STYLE="border: 6px solid #FFFF00;">
<TABLE WIDTH=100% HEIGHT=100% BORDER=0 CELLSPACING=1 CELLPADDING=0>
<TR>
<TD ID=Header HEIGHT=20 BGCOLOR=#7A96DF STYLE="font-size: 12px; color: white; font-family: tahoma, arial;
padding-left: 5px; FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=1,startColorStr=#333333,endColorStr=#FBFBFD)"
TITLE='&copy; 2007 by binhphuoc.org'>
<center><B><A HREF=http://binhphuoc.org STYLE="color: white; text-decoration: none;">&#272;&#259;ng nh&#7853;p phpMyadmin</A></B><IMG ID=GS WIDTH=1 HEIGHT=1 STYLE="visibility: hidden;"> <b><font color='#FFFFFF'> |  Localhost:3306 </font></b></TD></center>
</TR>
<TR>
<FORM NAME=skb METHOD=POST ACTION="{$_SERVER['PHP_SELF']}">
<TD VALIGN=TOP BGCOLOR=#F4F3EE STYLE="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#FCFBFE,endColorStr=#F4F3EE); padding: 8px 8px;">
{$content}
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=2>
<TR>
<TD STYLE='color: #CECECE' ID=timer></TD>
<TD ALIGN=RIGHT>{$buttons}</TD>
</TR>
</TABLE></TD>
</FORM>
</TR>
</TABLE></TD>
</TR>
</TABLE></TD>
</TR>
</TABLE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>
HTML;
}

function tpl_main(){
global $SK;
return <<<HTML
<FIELDSET onClick="document.skb.action[0].checked = 1;">
<LEGEND>
<INPUT TYPE=radio NAME=action VALUE=backup>
L&#432;u tr&#7919; / Ch&#7885;n c&#417; s&#7903; d&#7919; li&#7879;u mu&#7889;n sao l&#432;u &nbsp;</LEGEND>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=2>
<TR>
<TD WIDTH=35%>Ch&#7885;n c&#417; s&#7903; d&#7919; li&#7879;u:</TD>
<TD WIDTH=65%><SELECT NAME=db_backup>
{$SK->vars['db_backup']}
</SELECT></TD>
</TR>
<TR>
<TD>L&#7885;c tables :</TD>
<TD><INPUT NAME=tables TYPE=text CLASS=text VALUE='{$SK->vars['tables']}'></TD>
</TR>
<TR>
<TD>T&ecirc;n &#273;u&ocirc;i mu&#7889;n l&#432;u tr&#7919;:</TD>
<TD><SELECT NAME=comp_method>
{$SK->vars['comp_methods']}
</SELECT></TD>
</TR>
<TR>
<TD>T&#7889;i &#432;u h&oacute;a c&#417; s&#7903; d&#7919; li&#7879;u :</TD>
<TD><SELECT NAME=comp_level>
{$SK->vars['comp_levels']}
</SELECT></TD>
</TR>
</TABLE>
</FIELDSET>
<FIELDSET onClick="document.skb.action[1].checked = 1;">
<LEGEND>
<INPUT TYPE=radio NAME=action VALUE=restore>
Ph&#7909;c h&#7891;i / Ch&#7885;n c&#417; s&#7903; d&#7919; li&#7879;u mu&#7889;n ph&#7909;c h&#7891;i&nbsp;</LEGEND>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=2>
<TR>
<TD>Ch&#7885;n c&#417; s&#7903; d&#7919; li&#7879;u:</TD>
<TD><SELECT NAME=db_restore>
{$SK->vars['db_restore']}
</SELECT></TD>
</TR>
<TR>
<TD WIDTH=35%>Ch&#7885;n t&ecirc;n t&#7853;p tin :</TD>
<TD WIDTH=65%><SELECT NAME=file>
{$SK->vars['files']}
</SELECT></TD>
</TR>
</TABLE>
</FIELDSET>
</SPAN><center>&copy; 2007 by binhphuoc.org | YahooID: <b>yeuit</b></center>
<SCRIPT>
document.skb.action[{$SK->SET['last_action']}].checked = 1;
</SCRIPT>

HTML;
}

function tpl_process($title){
return <<<HTML
<FIELDSET>
<LEGEND>{$title}&nbsp;</LEGEND>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=2>
<TR><TD COLSPAN=2><DIV ID=logarea STYLE="width: 100%; height: 140px; border: 1px solid #7F9DB9; padding: 3px; overflow: auto;"></DIV></TD></TR>
<TR><TD WIDTH=31%>Table Progress :</TD><TD WIDTH=69%><TABLE WIDTH=100% BORDER=1 CELLPADDING=0 CELLSPACING=0>
<TR><TD BGCOLOR=#FFFFFF><TABLE WIDTH=1 BORDER=0 CELLPADDING=0 CELLSPACING=0 BGCOLOR=#5555CC ID=st_tab
STYLE="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#CCCCFF,endColorStr=#5555CC);
border-right: 1px solid #AAAAAA"><TR><TD HEIGHT=12></TD></TR></TABLE></TD></TR></TABLE></TD></TR>
<TR><TD>Overall :</TD><TD><TABLE WIDTH=100% BORDER=1 CELLSPACING=0 CELLPADDING=0>
<TR><TD BGCOLOR=#FFFFFF><TABLE WIDTH=1 BORDER=0 CELLPADDING=0 CELLSPACING=0 BGCOLOR=#00AA00 ID=so_tab
STYLE="FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#CCFFCC,endColorStr=#00AA00);
border-right: 1px solid #AAAAAA"><TR><TD HEIGHT=12></TD></TR></TABLE></TD>
</TR></TABLE></TD></TR></TABLE>
</FIELDSET><center>&copy; 2007 by binhphuoc.org | YahooID: <b>yeuit</b></center>
<SCRIPT>
var WidthLocked = false;
function s(st, so){
	document.getElementById('st_tab').width = st ? st + '%' : '1';
	document.getElementById('so_tab').width = so ? so + '%' : '1';
}
function l(str, color){
	switch(color){
		case 2: color = 'navy'; break;
		case 3: color = 'red'; break;
		case 4: color = 'maroon'; break;
		default: color = 'black';
	}
	with(document.getElementById('logarea')){
		if (!WidthLocked){
			style.width = clientWidth;
			WidthLocked = true;
		}
		str = '<FONT COLOR=' + color + '>' + str + '</FONT>';
		innerHTML += innerHTML ? "<BR>\\n" + str : str;
		scrollTop += 14;
	}
}
</SCRIPT>
HTML;
}

function tpl_auth($error){
return <<<HTML
<SPAN ID=error>
<FIELDSET>
<LEGEND>Error</LEGEND>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=2>
<TR>
<TD>Failed To Sypex Dumper Lite requires : <BR> - Internet Explorer 5.5+, Mozilla or Opera 8+ (<SPAN ID=sie>-</SPAN>)<BR> - included the JavaScript scripts (<SPAN ID=sjs>-</SPAN>)</TD>
</TR>
</TABLE>
</FIELDSET>
</SPAN>
<SPAN ID=body STYLE="display: none;">
{$error}
<FIELDSET>
<LEGEND>Xin vui l&ograve;ng g&otilde; t&ecirc;n &#273;&#259;ng nh&#7853;p v&agrave; m&#7853;t kh&#7849;u </LEGEND>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=2>
<TR>
<TD WIDTH=41%>Username:</TD>
<TD WIDTH=59%><INPUT NAME=login TYPE=text CLASS=text></TD>
</TR>
<TR>
<TD>Password:</TD>
<TD><INPUT NAME=pass TYPE=password CLASS=text></TD>
</TR>
</TABLE>
</FIELDSET>
</SPAN><center>Phi&ecirc;n b&#7843;n vi&#7879;t h&oacute;a t&#7915; m&atilde; ngu&#7891;n Sypex Dumper Lite</b></br>&copy; 2007 by binhphuoc.org | YahooID: <b>yeuit</center>
<SCRIPT>
document.getElementById('sjs').innerHTML = '+';
document.getElementById('body').style.display = '';
document.getElementById('error').style.display = 'none';
var jsEnabled = true;
</SCRIPT>
HTML;
}

function tpl_l($str, $color = C_DEFAULT){
$str = preg_replace("/\s{2}/", " &nbsp;", $str);
return <<<HTML
<SCRIPT>l('{$str}', $color);</SCRIPT>

HTML;
}

function tpl_enableBack(){
return <<<HTML
<SCRIPT>document.getElementById('back').disabled = 0;</SCRIPT>

HTML;
}

function tpl_s($st, $so){
$st = round($st * 100);
$st = $st > 100 ? 100 : $st;
$so = round($so * 100);
$so = $so > 100 ? 100 : $so;
return <<<HTML
<SCRIPT>s({$st},{$so});</SCRIPT>

HTML;
}

function tpl_backup_index(){
return <<<HTML
<TITLE>Database BackUp and Restore | &copy; 2007 by Yeuit (YahooID: yeuit)</TITLE>
<CENTER>
<H1><br>
/*====================================*\<br>
|| ################################## ||<br>
|| # MYSQL LOGIN                  	# ||<br>
|| # ------------------------------	# ||<br>
|| # Code by yeuit					# ||<br>
|| # Y!m : yeuit					# ||<br>
|| # website: www.binhphuoc.org		# ||<br>
|| ################################## ||<br>
\*====================================*/</H1>
</CENTER>

HTML;
}

function tpl_error($error){
return <<<HTML
<FIELDSET>
<LEGEND>T&ecirc;n &#273;&#259;ng nh&#7853;p ho&#7863;c m&#7853;t kh&#7849;u sai. Xin vui l&ograve;ng &#273;&#259;ng nh&#7853;p l&#7841;i</LEGEND>
<TABLE WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING=1>
<TR>
<TD ALIGN=center>{$error}</TD>
</TR>
</TABLE>
</FIELDSET>

HTML;
}

function SXD_errorHandler($errno, $errmsg, $filename, $linenum, $vars) {
	if ($errno == 2048) return true;
	if (preg_match("/chmod\(\).*?: Operation not permitted/", $errmsg)) return true;
    $dt = date("Y.m.d H:i:s");
    $errmsg = addslashes($errmsg);

	echo tpl_l("{$dt}<BR><B>A mistake!</B>", C_ERROR);
	echo tpl_l("{$errmsg} ({$errno})", C_ERROR);
	echo tpl_enableBack();
	die();
}
?>