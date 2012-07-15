<?php
$query = "select
l.list_name, l.list_outer_link
from f_topic t
join d_topic_type d
on   t.topic_type_id = d.topic_type_id
join f_topic_list l
on   t.topic_id = l.topic_id
where d.topic_type_desc = '音乐'
order by rand()
limit 1
;";


$mysqli = new mysqli('localhost','imsixthr_myweb','imsixthr_myweb','imsixthr_myweb01');
$mysqli->set_charset("utf8");
$result = $mysqli->query($query);
$row = $result->fetch_object();

echo '<h3>' . $row->list_name . '</h3>' . str_replace('_0/', '_1/', $row->list_outer_link);
$mysqli->close();
?>
