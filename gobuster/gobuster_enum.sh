#!/usr/bin/env bash

# update with your URL/path
target='http://10.10.10.173'
output='/tmp/gobuster.txt'
ext='php'

#---------
s='200,204,301,302,307,401'
a='Mozilla/5.0'

dirs=(
   '/opt/SecLists/Discovery/Web-Content/raft-large-directories.txt'
   '/opt/SecLists/Discovery/Web-Content/raft-large-words.txt'
)

files=(
   '/opt/SecLists/Discovery/Web-Content/Randomfiles.fuzz.txt'
   '/opt/SecLists/Discovery/Web-Content/raft-large-files.txt'
)

for list in ${dirs[@]}
do
   docker run --rm -it -v $list:/x gobuster dir -u $target -w /x -t 30 -a $a -s $s -kq -x $ext >> $output
done

for list in ${files[@]}
do
   docker run --rm -it -v $list:/x gobuster dir -u $target -w /x -t 30 -a $a -s $s -kq >> $output
done
