#!/bin/bash
# bash command-line arguments are accessible as $0 (the bash script), $1, etc.
echo "Running" $0 "on" $1

rm ./mail.csv
rm ./tokens.csv
rm ./token_counts.csv
rm ./state_counts.csv

touch ./mail.csv
touch ./tokens.csv
touch ./token_counts.csv
touch ./state_counts.csv

echo "file_name,from,to,cc,subject,date,message_id,body" >> ./mail.csv
echo "message_id,token" >> ./tokens.csv
echo "token,count" >> ./token_counts.csv
echo "token,count" >> ./state_counts.csv

ruby hw1.rb $1

awk -F ',' 'NR > 1 {count[$2]++}END{for(j in count) print j,","count[j]}' tokens.csv >> token_counts.csv
tr -d ' ' < token_counts.csv > temp.csv
cp temp.csv token_counts.csv
rm temp.csv

ruby state_fix.rb

exit 0
