#! /bin/bash -e

######################################################################
# Initialize the parameters
######################################################################
mysql_host="localhost"
mysql_user="myweb"
mysql_pass="myweb"
mysql_db="myweb01"
gen_home_dir="/home/lusaisai/wwwLearning/myweb0.1/genTool"
output_dir="$gen_home_dir/output_html"
output_css="$output_dir/css"
output_img="$output_dir/images"
output_js="$output_dir/js"
output_php="$output_dir/php"
cfg_dir="$gen_home_dir/cfg"
sql_dir="$gen_home_dir/sql"
tmp_dir="$gen_home_dir/tmp"
last_extract_file=$cfg_dir/gen_html.last_extract_value.dat
last_extract_value=$(cat $cfg_dir/gen_html.last_extract_value.dat)
mysql_connect_str="mysql --host=$mysql_host --user=$mysql_user --password=$mysql_pass --skip-column-names $mysql_db"
count_in_onepage=5
default_page_title="陆赛赛的网络小屋"
if [[ "$1" == "prod" ]]; then
	domain="http://im633.com"
else
	domain=$output_dir
fi

######################################################################
# Functions
######################################################################
# Generate the html head
function gen_html_head {
cat << EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>$html_title</title>
<link rel="shortcut icon" href="$domain/favicon.ico">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="$domain/js/navigation.js"></script>
<script type="text/javascript" src="$domain/js/logo.js"></script>
<link href="$domain/css/main.css" type="text/css" rel="stylesheet" />
$player_js
</head>

<body>
<ul id="nav">
<li><a href="$domain" >首页</a></li>
<li><a href="$domain/music" >音乐</a></li>
<li><a href="$domain/mv" >影音</a></li>
<li><a href="$domain/soccer" >足球</a></li>
<li><a href="$domain/fun" >有趣</a></li>
<li><a href="$domain/software" >软件</a></li>
<li><a href="$domain/blog" >博客</a></li>
<li><a href="$domain/others" >其他</a></li>
</ul>

<div id="main">

<div id="header">
<canvas id="logo" width="380" height="100"><img src="$domain/images/logo.png" alt="im633" ></canvas>
<div id="bwBox">
<h3 id="bw"><?php include("$domain/php/getPoem.php"); ?></h3>
</div>
</div>

<div id="bdy">
<div id="musicPlayer">
<h3>推荐我喜欢的音乐...</h3>
$default_music_loc
</div>
<div id="topicBox">
<div id="searchBox">
<form name="search">
<input type="search" name="search_word" value="搜索一下吧" maxlength="2048" size="50"/>
<select>
<option>全部</option>
<option>音乐</option>
<option>影音</option>
<option>足球</option>
<option>有趣</option>
<option>软件</option>
<option>博客</option>
<option>其他</option>
</option>
</select>
<input type="submit" name="submit_search" value="搜索" />
</form>
</div>
EOF
}

# Generate the html head
function gen_html_tail {
cat << EOF
</div>
</div>

</div>
</body>
</html>
EOF
}

#Generate the page links
function gen_page_links {
i=1
middle_start_point=$((current_page - 5))
middle_end_point=$((current_page + 5))
while [ $i -le $page_count ]
do
if [[ $i == 1 && $current_page == 1 ]]; then
cat << EOF
<div>
<a id="currentpagelinks" class="pagelinks" href="$domain/${page_dir}index.html" >$i</a>
EOF

elif [[ $i == 1 && $current_page != 1 ]]; then
cat << EOF
<div>
<a class="pagelinks" href="$domain/${page_dir}index.html" >$i</a>
EOF

else

	if [[ $middle_start_point > 2 ]]; then
cat << EOF
<div>
<span class="pagelinks">...</span>
EOF
i=$middle_start_point
	fi

	if [ $((middle_end_point + 1)) -lt $page_count ];then
		 if [ $i -eq $((middle_end_point + 1)) ];then
cat << EOF
<div>
<span class="pagelinks">...</span>
EOF
		 i=$page_count
		 fi
	fi

	if [[ $i == $current_page ]]; then
cat << EOF
<div>
<a id="currentpagelinks" class="pagelinks" href="$domain/${page_dir}index.html" >$i</a>
EOF
	else
cat << EOF
<div>
<a class="pagelinks" href="$domain/${page_dir}index.html" >$i</a>
EOF
	fi

fi

((i+=1))
done
}


# Generate the topic division
function gen_topic_div {
cat <<EOF
<div id="topic$topic_id" class="topic">
<span class="time">$modified_date</span>
<a href="$domain/topics/topic_$topic_id.html" class="topicTitle"><h3>$topic_name</h3></a>
EOF
}

# Generate the list division and enclose the topic division
function gen_list_div_head {
	case $topic_type_desc in
	'音乐')
cat << EOF
<img src="$list_image_loc" class="albumImage">
<span class="music listtxt">$list_desc</span>
<ul class="list">
<li id="list$list_id">$list_name</li>
EOF
	;;

	'影音'|'足球'|'有趣')
	if [[ $_list_count > 1 ]]; then
cat << EOF
<span class="listtxt">$list_desc</span>
$list_outer_link
<ul class="list">
<li id="list$list_id">$list_name</li>
EOF
	else
cat << EOF
<span class="listtxt">$list_desc</span>
$list_outer_link
EOF
	fi
	;;

	*)
	;;
	esac
}

function gen_list_div_middle {
cat << EOF
<li id="list$list_id">$list_name</li>
EOF
}


function gen_list_div_tail {
case $topic_type_desc in
	'音乐')
cat << EOF
</ul>
</div>
EOF
	;;

	'影音'|'足球'|'有趣')
if [[ $_list_count > 1 ]]; then
	echo '</ul>'
fi
cat << EOF
</div>
EOF
	;;

	*)
	;;
	esac
}


# Generate the javascript to changing the player
function gen_js_head {
	case $topic_type_desc in
	'音乐')
cat << EOF
\$( function() {

\$('#list$list_id').mouseover(function() {
	\$('#topic$topic_id img').attr('src', '$list_image_loc');
	\$('#topic$topic_id span.listtxt').html('$list_desc');
	});
\$('#list$list_id').click(function() {
	\$('#musicPlayer h3').html('$list_name');
	\$('#musicPlayer embed').remove();
	\$('#musicPlayer').append('$list_outer_link');
	\$('#musicPlayer').addClass("fixed");
	});

EOF
	;;

	'影音'|'足球'|'有趣')
	if [[ $_list_count > 1 ]]; then
cat << EOF
\$( function() {

\$('#list$list_id').click(function() {
	\$('#topic$topic_id span.listtxt').html('$list_desc');
	\$('#topic$topic_id embed').remove();
	\$('#topic$topic_id span.listtxt').after('$list_outer_link');
	});
EOF
	fi
	;;

	*)
	;;
	esac
}

function gen_js_middle {
if [[ $topic_type_desc == '音乐' ]]; then
cat << EOF
\$('#list$list_id').mouseover(function() {
	\$('#topic$topic_id img').attr('src', '$list_image_loc');
	\$('#topic$topic_id span.listtxt').html('$list_desc');
	});
\$('#list$list_id').click(function() {
	\$('#musicPlayer h3').html('$list_name');
	\$('#musicPlayer embed').remove();
	\$('#musicPlayer').append('$list_outer_link');
	\$('#musicPlayer').addClass("fixed");
	});
EOF
else
cat << EOF
\$('#list$list_id').click(function() {
	\$('#topic$topic_id span.listtxt').html('$list_desc');
	\$('#topic$topic_id embed').remove();
	\$('#topic$topic_id span.listtxt').after('$list_outer_link');
	});
EOF
fi
}


function gen_js_tail {
case $topic_type_desc in
	'音乐')
cat << EOF
}
)
;
EOF
	;;

	'影音'|'足球'|'有趣')
if [[ $_list_count > 1 ]]; then
cat << EOF
}
)
;
EOF
fi
	;;

	*)
	;;
	esac
}

# Generate topic division based on topic_id
function gen_topic_div_box {
   _topic_id=$1
   modified_date=$2
   get_data_query="select
   concat_ws( 0x07, l.list_id, l.topic_id, l.list_name, l.list_desc, l.list_image_loc, l.list_outer_link, l.list_other_link,
   t.topic_type_id, t.topic_name, d.topic_type_desc)
   from f_topic t
   join d_topic_type d
   on   t.topic_type_id = d.topic_type_id
   join f_topic_list l
   on   t.topic_id = l.topic_id
   where t.topic_id = $_topic_id
   ;"
   $mysql_connect_str --execute="$get_data_query" > $tmp_dir/topic_$_topic_id.info.txt
   topic_content_file=$tmp_dir/topic_$_topic_id.html
   > $topic_content_file
   topic_js_file=$tmp_dir/topic_$_topic_id.js
   > $topic_js_file
   _list_count=$(wc -l $tmp_dir/topic_$_topic_id.info.txt|awk '{print $1}')
   i=1
   while read _line
   do
      list_id=$(echo $_line | awk -F"\007" '{print $1}')
      topic_id=$(echo $_line | awk -F"\007" '{print $2}')
      list_name="$(echo $_line | awk -F"\007" '{print $3}')"
      list_desc="$(echo $_line | awk -F"\007" '{print $4}')"
      list_image_loc="$(echo $_line | awk -F"\007" '{print $5}')"
      list_other_link="$(echo $_line | awk -F"\007" '{print $7}')"
      topic_type_id=$(echo $_line | awk -F"\007" '{print $8}')
      topic_name="$(echo $_line | awk -F"\007" '{print $9}')"
      topic_type_desc="$(echo $_line | awk -F"\007" '{print $10}')"
		if [[ $topic_type_desc == "音乐" ]]; then
      	list_outer_link="$(echo $_line | awk -F"\007" '{print $6}')"
      else
      	list_outer_link="$(echo $_line | awk -F"\007" '{print $6}' | sed 's/width="[0-9]*"/width="680"/;s/height="[0-9]*"/height="480"/')"
      	set +e
      	echo $list_outer_link | grep allowFullscreen > /dev/null
      	rcode=$?
      	set -e
      	if [[ $rcode == 0 ]]; then
      		list_outer_link=$(echo $list_outer_link|sed 's/allowFullscreen=[^ 	]*//')
      	fi
      	list_outer_link=$(echo $list_outer_link | sed 's/embed/embed allowFullscreen="true"/1')
      fi

      if [[ $i == 1  ]]; then #gen the topic data only once
			gen_topic_div >> $topic_content_file
			gen_list_div_head >> $topic_content_file
			gen_js_head >> $topic_js_file
			if [[ $_list_count == 1 ]]; then
				gen_list_div_tail >> $topic_content_file
				gen_js_tail >> $topic_js_file
			fi
		elif [[ $i == $_list_count ]]; then
		   gen_list_div_middle >> $topic_content_file
			gen_list_div_tail >> $topic_content_file
			gen_js_middle >> $topic_js_file
			gen_js_tail >> $topic_js_file
		else
			gen_list_div_middle >> $topic_content_file
			gen_js_middle >> $topic_js_file
      fi
      ((i+=1))
   done < $tmp_dir/topic_$_topic_id.info.txt
}


# Generate default music player division
function gen_default_music_palyer {
	_topic_id_list=$1
	get_latest_list_query="select
l.list_outer_link
from f_topic t
join d_topic_type d
on   t.topic_type_id = d.topic_type_id
join f_topic_list l
on   t.topic_id = l.topic_id
where d.topic_type_desc = '音乐'
order by l.modified_ts desc
limit 1
;
"
	get_latest_list_query_using_topic_id="select
l.list_outer_link
from f_topic t
join d_topic_type d
on   t.topic_type_id = d.topic_type_id
join f_topic_list l
on   t.topic_id = l.topic_id
where d.topic_type_desc = '音乐'
and t.topic_id in ( $_topic_id_list )
order by t.modified_ts desc, l.list_id
limit 1
;"


	default_music_loc="$($mysql_connect_str --execute="$get_latest_list_query_using_topic_id")"
	if [[ "$default_music_loc" == "" ]]; then
		default_music_loc="$($mysql_connect_str --execute="$get_latest_list_query")"
	fi
}




######################################################################
# Main Generating Processes
######################################################################
echo "Copying common use files"
cp $cfg_dir/*png $output_img
cp $cfg_dir/*ico $output_dir
cp $cfg_dir/*php $output_php
cp $cfg_dir/*js $output_js
cp $cfg_dir/*css $output_css

######################################################################
# Generate the html block files to be used later
# Only generate newly updated topics/lists
######################################################################
echo "Generating html blocks"
get_topic_seq_query="select
t.topic_id, greatest(t.modified_ts, l.modified_ts)
from f_topic t
join ( select topic_id, max(modified_ts) as modified_ts from f_topic_list group by 1 ) l
on t.topic_id = l.topic_id
where greatest(t.modified_ts, l.modified_ts) >= '$last_extract_value'
order by 2 desc
;
"

$mysql_connect_str --execute="$get_topic_seq_query" > $tmp_dir/all_topic_id.txt
all_count=$(wc -l $tmp_dir/all_topic_id.txt | awk '{print $1}')
count_index=1
while [ $count_index -le $all_count ]
do
	gen_topic_div_box $(sed ''$count_index' !d' $tmp_dir/all_topic_id.txt)
	((count_index+=1))
done



######################################################################
# Generate individual pages
######################################################################
page_index=1
while [ $page_index -le $all_count ]
do
	page_dir="topics/"
	topic_id=$(sed ''$page_index' !d' $tmp_dir/all_topic_id.txt | awk '{print $1}')
	gen_default_music_palyer $topic_id
	html_title=$(sed '1 !d' $tmp_dir/topic_$topic_id.info.txt | awk -F"\007" '{print $9}' )
	if [ -n $tmp_dir/topic_$topic_id.js ];then
		player_js='<script type="text/javascript" src="'$domain'/js/topic_'$topic_id'.js"></script>'
		cp $tmp_dir/topic_$topic_id.js $output_js
	else
		player_js=""
	fi
	gen_html_head > $output_dir/${page_dir}topic_$topic_id.html
	cat $tmp_dir/topic_$topic_id.html >> $output_dir/${page_dir}topic_$topic_id.html
	gen_html_tail >> $output_dir/${page_dir}topic_$topic_id.html
	((page_index+=1))
done


######################################################################
# Generate Main pages
######################################################################
function gen_main_page {
	page_type=$1
	page_dir=$2
	get_topics_query="select
t.topic_id, greatest(t.modified_ts, l.modified_ts)
from f_topic t
join d_topic_type d
on   t.topic_type_id = d.topic_type_id
and  d.topic_type_desc like '%$page_type%'
join ( select topic_id, max(modified_ts) as modified_ts from f_topic_list group by 1 ) l
on t.topic_id = l.topic_id
order by 2 desc
;"

	mkdir -p $tmp_dir/${page_dir}
	$mysql_connect_str --execute="$get_topics_query" > $tmp_dir/${page_dir}_topic_id.txt
	topic_count=$(wc -l $tmp_dir/${page_dir}_topic_id.txt | awk '{print $1}')
	page_count=$((topic_count/count_in_onepage + 1))
	count_id=1
	page_index=1
	player_js=""
	current_div_all=""


	while [ $count_id -le $topic_count ]
	do
		topic_id=$(sed ''$count_id' !d' $tmp_dir/${page_dir}_topic_id.txt | awk '{print $1}')


		if [ -s $tmp_dir/topic_$topic_id.js ];then
			player_js="$player_js"'<script type="text/javascript" src="'$domain'/js/topic_'$topic_id'.js"></script>'
			cp $tmp_dir/topic_$topic_id.js $output_js
		fi



		current_div_all="$current_div_all"$(cat $tmp_dir/topic_$topic_id.html)


		if [ $((count_id % 5)) -eq 0 -o $count_id -eq $topic_count ];then
			current_page=$page_index
			gen_default_music_palyer $topic_id
			html_title=$default_page_title
			if [[ $page_index == 1 ]]; then
				gen_html_head > $output_dir/${page_dir}index.html
				echo $current_div_all >> $output_dir/${page_dir}index.html
				gen_page_links >> $output_dir/${page_dir}index.html
				gen_html_tail >> $output_dir/${page_dir}index.html
			else
				gen_html_head > $output_dir/${page_dir}${page_dir%%/}_$page_index.html
				echo $current_div_all >> $output_dir/${page_dir}${page_dir%%/}_$page_index.html
				gen_page_links >> $output_dir/${page_dir}index.html
				gen_html_tail >> $output_dir/${page_dir}index.html
			fi
			player_js=""
			current_div_all=""
			((page_index+=1))
		fi
		((count_id+=1))
	done
}

echo "Generating main pages..."
gen_main_page "" ""

echo "Generating music pages..."
gen_main_page "音乐" "music/"

echo "Generating soccer pages..."
gen_main_page "足球" "soccer/"

echo "Generating mv pages..."
gen_main_page "影音" "mv/"


######################################################################
# Post Jobs
######################################################################
# Update last extract value
#date +'%F %R:%S' > $last_extract_file









exit 0
