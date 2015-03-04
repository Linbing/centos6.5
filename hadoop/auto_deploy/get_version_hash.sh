#!/usr/bin/env bash
#  Filename: get_version_hash.sh
#   Created: 2015-01-03 09:10:22
#      Desc: get git version and hash_key  (some description)
#    Author: linbing, linbing@semptian.com
#   Company: semptian


#get the git log of commit and hash_key in .verion_commit.txt
git log | grep 'commit'> .version_commit.txt

#filter some illegally line
sed -e '/\:/d;/\./d;\/,/d;/Revert/d' .version_commit.txt > .version.txt

#reverse order of .version.txt
perl -e 'print reverse<>' .version.txt > .version_hash.txt

if [ -e version_hash.txt ];
then
    rm -rf version_hash.txt;
fi;

#add version number in version_hash.txt
sed = .version_hash.txt | sed 'N;s/\n/\t/' > version_hash.txt

#show curren version 
echo "Curren Version Number"
wc -l version_hash.txt | awk '{ print $1 }'


rm -rf .version_hash.txt .version.txt .version_commit.txt




