#! /bin/bash -ex

######################################################################
# Initialize the parameters
######################################################################
export mysql_host="localhost"
export mysql_user="myweb"
export mysql_pass="myweb"
export mysql_db="myweb01"
export gen_home_dir="/home/lusaisai/wwwLearning/myweb0.1/genTool"
export output_dir="$gen_home_dir/output_html"
export output_css="$output_dir/css"
export output_img="$output_dir/images"
export output_js="$output_dir/js"
export output_php="$output_dir/php"
export cfg_dir="$gen_home_dir/cfg"
export sql_dir="$gen_home_dir/sql"
export tmp_dir="$gen_home_dir/tmp"
export mysql_connect_str="mysql --host=$mysql_host --user=$mysql_user --password=$mysql_pass --skip-column-names $mysql_db"
export count_in_onepage=5
export default_page_title="陆赛赛的网络小屋"
#export domain="http://im633.com"
export domain=$output_dir


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
<canvas id="logo" width="380" height="100"><img src="images/logo.png" alt="im633" ></canvas>
<h3 id="bw"><?php include("php/getPoem.php"); ?></h3>
</div>

<div id="bdy">
<div id="musicPlayer">
<h3>我喜欢的音乐...</h3>
$default_muisc_loc
</div>
<div id="topicBox">
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

