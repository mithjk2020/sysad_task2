#!/bin/bash

cat <<EOL > /cont/dbsql/gemini.sql
CREATE TABLE taskz (
  mentee VARCHAR(50) NOT NULL,
  rollno INTEGER NOT NULL,
  domain VARCHAR(50) NOT NULL,
  taskno INTEGER NOT NULL,
  status VARCHAR(10) 
);
EOL


while IFS= read -r line
do
 line=($line)
 name=${line[0]}
 rollno=${line[1]}
 domain=""
 while IFS= read -r lines; do
    if [[ $lines =~ :$ ]]; then
        domain="${lines%:}"
    elif [[ $line =~ Task[0-9]+: ]]; then
        taskno=$(echo "$lines" | cut -d: -f1 | xargs)
        status=$(echo "$lines" | cut -d: -f2 | xargs)
        echo "INSERT INTO taskz (rollno, mentee, domain, taskno, status) VALUES ('$rollno', '$name', '$domain','$taskno', '$status');" >> /cont/dbsql/gemini.sql
    fi
 done < "/home/admin/mentees/$name/task_completed.txt"
done < "/home/admin/mentees_domain.txt"

