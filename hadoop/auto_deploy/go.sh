#!/usr/bin/env bash
#  Filename: go.sh
#   Created: 2015-02-11 21:08:39
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: semptian


#file=`basename $1`
#eval $file
TOP_DIR=`pwd`

DEST_USER=lb
DEST_HOST=192.168.1.116
DEST_DIR=/home/lb/
SCP_DEST=${DEST_USER}@${DEST_HOST}:${DEST_DIR}
SSH_DEST=${DEST_USER}@${DEST_HOST}

FILE=mk.sh

IP=(192.168.40.1 192.168.40.2 192.168.40.3)

#echo ${IP[*]}

for ip in "${IP[@]}";do
    echo $ip
done

for ip in "${IP[*]}";do
    echo $ip
done



if [ $# -eq 0 ];
then
    echo "no file "
    exit
fi


COMMAND=./$FILE
echo $TOP_DIR
export TOP_DIR
#scp $FILE $DEST_USER@$DEST_HOST:$DEST_DIR
#scp $FILE $SCP_DEST 
#ssh $SSH_DEST "$COMMAND;touch a.c"
