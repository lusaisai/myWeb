#! /bin/bash -e

######################################################################
# Initialize the parameters
######################################################################
export mysql_host="localhost"
export mysql_user="myweb"
export mysql_pass="myweb"
export mysql_db="myweb01"
export gen_home_dir="/home/lusaisai/wwwLearning/myweb0.1/genTool"
export output_dir="$gen_home_dir/output_html"
export cfg_dir="$gen_home_dir/cfg"
export sql_dir="$gen_home_dir/sql"
export tmp_dir="$gen_home_dir/tmp"
export mysql_connect_str="mysql --host=$mysql_host --user=$mysql_user --password=$mysql_pass --skip-column-names $mysql_db"
export show_topic_query="select topic_type_id, topic_type_desc from d_topic_type;"

######################################################################
# Get the topic types
######################################################################
$mysql_connect_str --execute="$show_topic_query" > $tmp_dir/all_topic_types.txt
while read _index _content
do
	topic_array[_index]=$_content
done < $tmp_dir/all_topic_types.txt

######################################################################
# Ask user for input
######################################################################
function ask_topic_type {
while :
do
	echo "Please choose the topic you want to add: "
	cat $tmp_dir/all_topic_types.txt
	read topic_type_id
	if [ -n "${topic_array[topic_type_id]}" ]; then
		echo "your choice is ${topic_array[topic_type_id]}"
		break
	else
		echo
		echo "Sorry, your input is invalid."
		continue
	fi
done
}

function ask_topic {
while :
do
   echo "========================================================================"
   echo "Please input your topic name: "
   read topic_name
   echo "Please give some tags for this topic: "
   read topic_tags
   echo "Is this topic strongly recommended? (Y/N): "
   read topic_recom_flag

   echo "Below is what you have just input, enter y to deploy to mysql, enter n to reinput"
   echo "Topic Name: $topic_name"
   echo "Topic Tags: $topic_tags"
   echo "Topic Recommandation: $topic_recom_flag"
   read _input
   if [[ "$_input" == 'y' || "$_input" == 'Y' ]]; then
      break
   else
      continue
   fi
done
} 

function ask_single_topic_list {
   while :
   do
      echo "Please enter your list name: "
      read list_name
      echo "Please enter the image link: "
      read list_image_loc
      echo "Please enter the external embed link: "
      read list_outer_link
      echo "Please enter any other link to be used for this topic/list "
      read list_other_link
      echo "Please enter your description of this list, use @FILE:<file path> to indicate you want to import data from a file."
      read list_desc
      
      if [ "$(echo $list_desc | awk -F":" '{print $1}')" == "@FILE" ]; then
      	file_name=$(echo $list_desc | awk -F":" '{print $2}')
      	list_desc=$(sed '1, /^<BODY/ d;/^<\/BODY/, $ d' $file_name | tr '\n' ' ')
      fi
      
      if [ "${topic_array[topic_type_id]}" = '博客' -o "$topic_name" = '博客' ]; then
      	list_outer_link=$(echo $list_outer_link | sed 's:_0/:_1/:')
      fi

      list_desc=$(echo $list_desc | sed s/\'/\'\'/g)

      echo "Below is what you have just input, enter y to deploy to mysql, enter n to reinput"
      echo "List Name: $list_name"
      echo "List Description: $list_desc"
      echo "List Image Link: $list_image_loc"
      echo "List Outer Link: $list_outer_link"
      echo "List Other Link: $list_other_link"
      read _input
      if [[ "$_input" == 'y' || "$_input" == 'Y' ]]; then
          break
      else
          continue
      fi
   done
}

function ask_topic_lists {
   echo "Now let's add a list into topic $topic_name"
   while :
   do
      echo "========================================================================"
      ask_single_topic_list
      deploy_new_topic_list
      echo "Add another list to this topic $topic_name?(y/n)"
      read _input
      if [[ "$_input" == 'y' || "$_input" == 'Y' ]]; then
         continue
      else
         break
      fi
   done
}
######################################################################
# Push to MySQL
######################################################################
function deploy_new_topic {
   topic_name=$(echo $topic_name | sed s/\'/\'\'/g)
   f_topic_insert_query="insert into f_topic (topic_type_id, topic_name, topic_tags, topic_recom_flag)
   values ($topic_type_id, '$topic_name', '$topic_tags', '$topic_recom_flag');" 
   $mysql_connect_str --execute="$f_topic_insert_query"
}

function deploy_new_topic_list {
   f_topic_list_insert_query="insert into f_topic_list (topic_id,list_name,list_desc,list_image_loc,list_outer_link,list_other_link) select max(topic_id), '$list_name', '$list_desc', '$list_image_loc', '$list_outer_link', '$list_other_link' from f_topic where topic_name='$topic_name';"

   $mysql_connect_str --execute="$f_topic_list_insert_query"
}

######################################################################
# Main
######################################################################

while :
do
   clear
   echo "========================================================================"
   echo "Welcome:), please choose the number to tell me what you want to do"
   echo "1 - add a new topic"
   echo "2 - add topic list for existing topic"
   echo "0 - exit"
   read _input

   case "$_input" in
   1)
      ask_topic_type
      ask_topic 
      deploy_new_topic
      ask_topic_lists
      ;;
   2) echo "Please enter the topic name: "
      read _input
      echo $_input
      topic_name="$_input"
      ask_topic_lists
      ;;

   0) break
      ;;

   *) echo "Wrong choice! Please re-choose."
      ;;

    esac
done


