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

page_count=2
current_page=2


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

gen_page_links

