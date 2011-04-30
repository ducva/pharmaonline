<?php 
 session_start();
 $link=mysql_connect("localhost", "root", "")
or die("Ko ket noi dc");
mysql_select_db("qtmgroup", $link);

 	
 function tree($id_parent = 0, $indent = 0) 
    { 
        global $g_tree, $ret_tree; 
        $tt = array(); 
        $x = 0; 
        $loop = 0; 

        foreach($g_tree as $n) 
        {          
            if( $n['id_parent'] == $id_parent) 
            { 
                $tt[$x++] = $loop;   
            }   
            $loop++; 
        } 
        /*-- if there are some parent ids --*/ 
        if( $x != 0){              
            foreach($tt as $d) 
            { 
                $tmp = array(); 
                 
                foreach($g_tree[$d] as $key => $value) 
                {                 
                    $tmp[$key] = $value;  
                } 
                $tmp['indent'] = $indent; 

                $ret_tree[] = $tmp; 
                 
                tree($tmp['id'], $indent+1); 
            } 
        } 
        else 
        { 
            return; 
        } 
    } 

// Example of how to use it 
// 
$g_tree = array(); 

$id=1;
$r=mysql_query("select * from member where Id='".$id."'");
	$rs=mysql_fetch_object($r);
			$g_tree[]  = array( 
                    'id'        => $id, 
                    'id_parent' => 0, 
                    'title'     => $rs->Fullname); 	
			
			$r1=mysql_query("select * from member where Id not in ('".$id."') and RootId not in ('0')");
					
			while($rs1=mysql_fetch_object($r1))
			{
				$g_tree[]  = array( 
						'id'        => $rs1->Id, 
						'id_parent' => $rs1->RootId, 
						'title'    => $rs1->Fullname);  
								
			}

$ret_tree = array(); 
  
// __Recursive function call__ 
// If you want to print out only 
// a subtree you have to modify the first value 
// of this function to the id of the subtree 
// 
tree(0,0); 
  
//Print the tree structure with indents 
// 
echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<p align="center"><a href="./">Trang chủ</a> </p><table width="500" border="0" align="center">
  <tr>
    <td><fieldset><legend><strong>Sơ đồ mạng lưới</strong>:</legend>
        <table width="500" border="0" align="center">
         <tr><td>
';

foreach($ret_tree as $cat) 
{ 
    $indent = ''; 
     
    for($i=0;$i<$cat['indent'];$i++) 
    { 
        $indent .= '....'; 
    } 
   
    echo $indent.' <a href="detail.php?ID='.$cat['id'].'">'.$cat['title'].'</a><br>'; 
}    
echo '</td></tr> </table>
    </fieldset></td>
  </tr>
</table>';

	

?>