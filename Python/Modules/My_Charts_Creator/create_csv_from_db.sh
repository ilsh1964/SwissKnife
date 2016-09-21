#!/bin/bash
filename=The_Data_File.csv
db_name=chart.db

sqlite3 $db_name "select * from df;" |awk -F'|' '{print $2 ","  $3}' > $filename
