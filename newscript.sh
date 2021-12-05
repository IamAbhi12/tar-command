#!/bin/sh

randomString="SEPARATOR_FOR_ARCHIVING_FILES"

if [ "$1" = "tvf" ]
then
	cat "$2details.txt"
	
elif [ "$1" = "cvf" ]
then
	cd "$3"
	filelist=($(ls))
	ls -l > "$2details.txt"

	for item in "${filelist[@]}"
	do
		echo "$randomString" >> "$2"
		echo "$item" >> "$2"
		cat "$item" >> "$2"
	done
elif [ "$1" = "xvf" ]
then
	mkdir $2_directory
	while read line; 
	do
		if [ "$line" = "$randomString" ]
		then
			read line
			filename=$2_directory/$line
		else
			echo "$line" >> "$filename"
		fi
	done < "$2"
else
	echo "Check the command and try again."
fi





