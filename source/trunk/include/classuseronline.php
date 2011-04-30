<?php
class UsersOnline {
   
   	var $host     = 'localhost';
    var $database ='99k';
    var $user     = 'vietsun_99k';
    var $password = 'vietsun.vn';
    var $timeoutSeconds = 120;
    var $numberOfUsers = 0;
    function UsersOnline() {
        $this->refresh();                                                                            
    }

    function getNumber() {
        return $this->numberOfUsers;
    }
 
    function printNumber() {
            echo "<strong>".($this->numberOfUsers + 2)."</strong>";
    }

    function refresh() {
        global $PHP_SELF;  
		$SESSION_ID=session_id();
        $currentTime = time();
        $timeout = $currentTime - $this->timeoutSeconds;
		$GianHangID=$_GET['Shop_ID'];  
        mysql_connect($this->host, $this->user, $this->password)
            or die('Error conecting to database');        
        mysql_db_query($this->database,
                       "INSERT INTO usersonline VALUES ('$currentTime','$SESSION_ID','$PHP_SELF','$GianHangID')")
            or die('Error writing to database');                       
        mysql_db_query($this->database,
                       "DELETE FROM usersonline WHERE timestamp < $timeout")
            or die('Error deleting from database');         
        $result = mysql_db_query($this->database,
                                 "SELECT DISTINCT SessionID FROM usersonline WHERE file='$PHP_SELF' and gianhang_id='$GianHangID'")
            or die('Error reading from database');
        $this->numberOfUsers = mysql_num_rows($result);                                                                                 
        //mysql_close();
    }
}
?>