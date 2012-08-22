#! /bin/bash


######################################################################
# Initialize the parameters
######################################################################
gen_home_dir="/home/lusaisai/wwwLearning/myweb0.1/genTool"
output_dir="$gen_home_dir/output_html"
last_dir="$gen_home_dir/latest_html"
upload_dir="$gen_home_dir/upload_html"
diff_result_file="$gen_home_dir/tmp/diff.txt"
upload_zip_file="upload.tar.gz"

######################################################################
# comparing
######################################################################
diff -rq $output_dir $last_dir > $diff_result_file


######################################################################
# Creating upload dirs
######################################################################
rm -rf $upload_dir
mkdir $upload_dir
cd $upload_dir
mkdir blog css feed fun images js music mv others php soccer software topics

######################################################################
# Parsing result and generating upload files
######################################################################
function copy_new_file {
	input="$*"
	echo $input | grep $output_dir > /dev/null
	rcode=$?
	if [ $rcode -eq 0 ]; then
		file_name=$(echo $input |sed -e 's/^Only in //' -e 's/: /\//')
		target_folder=$(echo $input | awk '{print $3}' | sed -e 's:'$output_dir'::' -e 's/://')
		cp -r $file_name $upload_dir$target_folder
	fi
}

function copy_diff_file {
	input="$*"
	file_name=$(echo $input | awk '{print $2}')
	target_folder=$(echo $input | awk '{print $2}' | sed 's:'$output_dir'::')
	cp -r $file_name $upload_dir$target_folder
}

while read line
do
	echo $line | grep "Only in" > /dev/null
	rcode=$?
	if [ $rcode -eq 0 ]; then
		copy_new_file $line
	else
		copy_diff_file $line
	fi
done < $diff_result_file

######################################################################
# Push to bluehost and copy the uploaded files to the latest dir
######################################################################
echo "Push new code to im633.com?(Y/y)"

read x
if [ "$x" = "y" -o "$x" = "Y" ]; then
   echo "Compress files..."
   tar -zcvf $upload_zip_file *
   echo "Scp file to im633.com and extract..."
   scp $upload_zip_file imsixthr@im633.com:/home7/imsixthr/public_html
   ssh imsixthr@im633.com "cd /home7/imsixthr/public_html;tar -xzf upload.tar.gz"
   echo "Copy uploaded files to the latest dir"
	cp -r $upload_dir/* $last_dir
	echo "Copying done!"
fi


exit 0
