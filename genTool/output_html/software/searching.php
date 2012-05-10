<?php
$search_word = trim($_GET['search_word']);
$search_type = trim($_GET['search_type']);

if ( !$search_word || !$search_type ) {
	exit;
}

if ( $search_type == '全部' ) {
	$search_type = "";
}

$search_word = addslashes($search_word);
$keyword_list = split(' ', $search_word, 20);
$topic_name_query = " case when locate('$keyword_list[0]', topic_name) > 0 then 1";
$list_name_query = " case when locate('$keyword_list[0]',  list_name)  > 0  then 1";
$list_desc_query = " case when locate('$keyword_list[0]', list_desc) > 0 then 1";
$topic_tags_query = " case when locate('$keyword_list[0]', topic_tags) > 0 then 1";
$join_query = " from f_topic t
   join d_topic_type d
   on   t.topic_type_id = d.topic_type_id
   join f_topic_list l
   on   t.topic_id = l.topic_id
   where d.topic_type_desc like '%$search_type%'";

$where_query = " and locate('$keyword_list[0]', concat(topic_name,list_name,list_desc,topic_tags)) > 0";


for ( $i=1; $i < count($keyword_list); $i++ ) {
	$where_query .= " and locate( '$keyword_list[$i]', concat(topic_name,list_name,list_desc,topic_tags) ) > 0 ";
	$topic_name_query .= " when locate('$keyword_list[$i]', topic_name) > 0 then 1";
	$list_name_query .= " when locate('$keyword_list[$i]',  list_name)  > 0  then 1";
	$list_desc_query .= " when locate('$keyword_list[$i]', list_desc) > 0 then 1";
	$topic_tags_query .= " when locate('$keyword_list[$i]', topic_tags) > 0 then 1";
}
$topic_name_query .= " else 0 end as topic_name_rank, ";
$list_name_query .= " else 0 end as list_name_rank, ";
$list_desc_query .= " else 0 end as list_desc_rank, ";
$topic_tags_query .= " else 0 end as topic_tags_rank";

$query = "select topic_id, topic_name from (select t.topic_id, t.topic_name, " . $topic_name_query . $list_name_query . $list_desc_query . $topic_tags_query . $join_query . $where_query. ") c group by 1,2 order by sum(topic_name_rank) desc, sum(list_name_rank) desc, sum(list_desc_rank) desc, sum(topic_tags_rank) desc limit 20";

$mysqli = new mysqli('localhost','imsixthr_myweb','imsixthr_myweb','imsixthr_myweb01');
$mysqli->set_charset("utf8");
if ($result = $mysqli->query($query)) {
		if ( $result->num_rows == 0 ) {
		echo "<p>没有搜索结果，尝试其他关键词吧。</p>";
	}
while ($row = $result->fetch_object()) {
	echo '<a target="_blank" href="http://im633.com/topics/topic_' . $row->topic_id . '.html" class="topicTitle"><h4>' . $row->topic_name . '</h4></a>';
}
} else {
	exit;
} // end else
$mysqli->close();

?>
