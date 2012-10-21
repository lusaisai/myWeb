#! /bin/bash -e

######################################################################
# Initialize the parameters
######################################################################
mysql_host="localhost"
mysql_user="myweb"
mysql_pass="myweb"
mysql_db="myweb01"
gen_home_dir="/home/lusaisai/wwwLearning/myweb0.1/genTool"
tmp_dir="$gen_home_dir/tmp"
original_file="$tmp_dir/list_embed_map.txt"
output_file="$tmp_dir/list_music_id_map.txt"
mysql_connect_str="mysql --host=$mysql_host --user=$mysql_user --password=$mysql_pass --skip-column-names $mysql_db"
query="select
concat_ws( 0x07, l.list_id, l.list_outer_link)
from f_topic t
join d_topic_type d
on   t.topic_type_id = d.topic_type_id
join f_topic_list l
on   t.topic_id = l.topic_id
where d.topic_type_desc = '音乐'
;
"

######################################################################
# Process the data
######################################################################
echo "Parsing ..."
$mysql_connect_str --execute="$query" > $original_file
> $output_file

while read _line
do
   list_id=$(echo $_line | awk -F"\007" '{print $1}')
   list_outer_link=$(echo $_line | awk -F"\007" '{print $2}')
   music_ids=$(echo $list_outer_link|sed -e 's:^.*4097932_::' -e 's:,_235_346_000000_494949_0.*$::')
   echo $music_ids | awk -F"," '{ for(i=1;i<=NF;i++) print '$list_id', $i }' >> $output_file
done < $original_file


######################################################################
# Load into Database
######################################################################
echo "Loading ..."
query="delete from myweb01.d_id_map; LOAD DATA LOCAL INFILE '$output_file' INTO TABLE myweb01.d_id_map FIELDS TERMINATED BY ' '"
$mysql_connect_str --execute="$query"


######################################################################
# Send to Remote
######################################################################
echo "Sending to remote ..."
query="delete from imsixthr_myweb01.d_id_map; LOAD DATA LOCAL INFILE '/home7/imsixthr/public_html/${output_file##*/}' INTO TABLE imsixthr_myweb01.d_id_map FIELDS TERMINATED BY ' '"
gzip -f $output_file
scp $output_file.gz imsixthr@im633.com:/home7/imsixthr/public_html
ssh imsixthr@im633.com "cd /home7/imsixthr/public_html;gunzip -f ${output_file##*/}.gz; echo \"$query\" | mysql --database=imsixthr_myweb01 -u imsixthr_myweb -pimsixthr_myweb"

echo "Complete!"

