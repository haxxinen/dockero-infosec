#!/usr/bin/env bash

# update with your URL/path
target='http://example.com'
output='/tmp/gobuster.txt'
ext=''
t=30

[[ -e $output ]] && rm $output

#---------
s='200,204,301,302,307,401'
a='Mozilla/5.0'

dirs=(
   '/opt/SecLists/Discovery/Web-Content/raft-large-directories.txt'
   '/opt/SecLists/Discovery/Web-Content/raft-large-words.txt'
   '/opt/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-big.txt'
   '/opt/SecLists/Discovery/Web-Content/big.txt'
)

files=(
   '/opt/SecLists/Discovery/Web-Content/Randomfiles.fuzz.txt'
   '/opt/SecLists/Discovery/Web-Content/raft-large-files.txt'
)

list="/tmp/$RANDOM$RANDOM"

cat ${dirs[@]} | tr 'A-Z' 'a-z' | sort -u > $list
if [[ -n $ext ]]; then
docker run --rm -it -v $list:/x gobuster dir -u $target -w /x -t $t -a $a -s $s -kq -x $ext >> $output
else
docker run --rm -it -v $list:/x gobuster dir -u $target -w /x -t $t -a $a -s $s -kq >> $output
fi

cat ${dirs[@]} | tr 'A-Z' 'a-z' | sort -u > $list
docker run --rm -it -v $list:/x gobuster dir -u $target -w /x -t $t -a $a -s $s -kq >> $output

rm $list
