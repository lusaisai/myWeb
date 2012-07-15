<?php
$username="imsixthr_myweb";
$password="imsixthr_myweb";
$database="imsixthr_myweb01";
$dblink=mysql_connect(localhost,$username,$password);
mysql_set_charset('utf8',$dblink); 
@mysql_select_db($database) or die( "Unable to select database");
$query="select case when character_length(poet) > 0 then concat_ws(' - ', poem_content, poet) else poem_content end as poem_content from f_poem order by rand() limit 1;";
$result=mysql_query($query);
echo mysql_result($result,0,"poem_content");
mysql_close();
?>