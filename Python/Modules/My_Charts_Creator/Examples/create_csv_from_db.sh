#!/bin/bash
filename=The_Data_File.csv
db_name=chart.db

sqlite3 $db_name "select * from df;" |awk -F'|' '{print $2 ","  $3}' > $filename
sed -i 's/-/ /g' $filename
sed -i 's/,/ /g' $filename
awk '{print $3","$5}' $filename > /tmp/awk_tmp
cp -r /tmp/awk_tmp $filename
