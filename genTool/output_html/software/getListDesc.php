<?php
$list_id = trim($_GET['list_id']);
$username="imsixthr_myweb";
$password="imsixthr_myweb";
$database="imsixthr_myweb01";
$dblink=mysql_connect(localhost,$username,$password);
mysql_set_charset('utf8',$dblink); 
@mysql_select_db($database) or die( "Unable to select database");
$query="select list_desc from f_topic_list where list_id = $list_id;";
$result=mysql_query($query);
echo mysql_result($result,0,"list_desc");
mysql_close();
?>