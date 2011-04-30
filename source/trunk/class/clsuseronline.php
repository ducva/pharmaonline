<?php
class clsUsersOnline {
   
    var $timeoutSeconds = 120;
    var $numberOfUsers = 0;
    function clsUsersOnline() {
        $this->refresh();                                                                            
    }

    function getNumber() {
        return $this->numberOfUsers;
    }
 
    function printNumber() {
            echo "<strong>".$this->numberOfUsers."</strong>";
    }

    function refresh() {
    	$oUsersOnline=new clsTable('usersonline');
        global $PHP_SELF;  
		$SESSION_ID=session_id();
        $currentTime = time();
        $timeout = $currentTime - $this->timeoutSeconds;
        $oUsersOnline->insert("TimeStamp,SessionID,File","'$currentTime','$SESSION_ID','$PHP_SELF'");
        $oUsersOnline->delete("TimeStamp < $timeout");                  
        $aUsersOnline=$oUsersOnline->select("DISTINCT SessionID","","","File='$PHP_SELF'");  
        $this->numberOfUsers = count($aUsersOnline);                                                                                 
        //mysql_close();
    }
}
?>