#!/bin/bash
echo $1
ls $1/*.gz > /home/hadoop/bin/tars.log
for files in $(cat /home/hadoop/bin/tars.log)
do
	echo "file is:"$files
	tar -zxf $files
done

