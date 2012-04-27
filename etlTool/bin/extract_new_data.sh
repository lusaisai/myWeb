#! /bin/bash -e

######################################################################
# Initialize the parameters
######################################################################
mysql_host="localhost"
mysql_user="myweb"
mysql_pass="myweb"
mysql_db="myweb01"
etl_home_dir="/home/lusaisai/wwwLearning/myweb0.1/etlTool"
etl_out_dir="$etl_home_dir/output"
etl_dat_dir="$etl_home_dir/dat"
etl_tmp_dir="$etl_home_dir/tmp"
last_extract_file=$etl_dat_dir/last_extract_value.dat
last_extract_value=$(cat $last_extract_file)
mysql_connect_str="mysql --host=$mysql_host --user=$mysql_user --password=$mysql_pass --skip-column-names $mysql_db"
sql_file=$etl_out_dir/topic_list_del_ins.sql


> $sql_file

######################################################################
# f_topic
######################################################################
get_data_query="select concat_ws(0x07,topic_id,topic_type_id,topic_name,topic_tags,topic_recom_flag,modified_ts) from f_topic where modified_ts >= '$last_extract_value';";

echo "delete from stg_f_topic_w;" >> $sql_file

$mysql_connect_str --execute="$get_data_query" | sed s/\'/\'\'/g > $etl_tmp_dir/f_topic.txt

while read _line
do
	topic_id=$(echo $_line | awk -F"\007" '{print $1}')
	topic_type_id=$(echo $_line | awk -F"\007" '{print $2}')
	topic_name="$(echo $_line | awk -F"\007" '{print $3}')"
	topic_tags="$(echo $_line | awk -F"\007" '{print $4}')"
	topic_recom_flag="$(echo $_line | awk -F"\007" '{print $5}')"
	modified_ts="$(echo $_line | awk -F"\007" '{print $6}')"
	echo "insert into stg_f_topic_w select " "$topic_id, " "$topic_type_id, " "'$topic_name', " "'$topic_tags', " "'$topic_recom_flag', " "'$modified_ts'" " from dual;" >> $sql_file
done < $etl_tmp_dir/f_topic.txt


######################################################################
# f_topic_list
######################################################################
get_data_query="select concat_ws(0x07,list_id,topic_id,list_name,list_desc,list_image_loc,list_outer_link,list_other_link,modified_ts) from f_topic_list where modified_ts >= '$last_extract_value';";

echo "delete from stg_f_topic_list_w;" >> $sql_file

$mysql_connect_str --execute="$get_data_query" | sed s/\'/\'\'/g > $etl_tmp_dir/f_topic_list.txt

while read _line
do
	list_id=$(echo $_line | awk -F"\007" '{print $1}')
	topic_id=$(echo $_line | awk -F"\007" '{print $2}')
	list_name="$(echo $_line | awk -F"\007" '{print $3}')"
	list_desc="$(echo $_line | awk -F"\007" '{print $4}')"
	list_image_loc="$(echo $_line | awk -F"\007" '{print $5}')"
	list_outer_link="$(echo $_line | awk -F"\007" '{print $6}')"
	list_other_link="$(echo $_line | awk -F"\007" '{print $7}')"
	modified_ts="$(echo $_line | awk -F"\007" '{print $8}')"
	echo "insert into stg_f_topic_list_w select " "$list_id, " "$topic_id, " "'$list_name', " "'$list_desc', " "'$list_image_loc', " "'$list_outer_link', " "'$list_other_link', " "'$modified_ts'" " from dual;" >> $sql_file
done < $etl_tmp_dir/f_topic_list.txt


######################################################################
# compress
######################################################################
gzip $sql_file

echo "Please import file $sql_file and run call topic_list_ups to upsert."

