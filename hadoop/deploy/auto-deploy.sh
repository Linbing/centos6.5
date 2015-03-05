#!/bin/sh

CUR=`dirname "${BASH_SOURCE-$0}"`
CUR=`cd "$cur"; pwd`
TOP="${CUR}"/../

HADOOP_SITE="${TOP}"/site/hadoop/
HBASE_SITE="${TOP}"/site/hbase/
ZOOKEEPER_SITE="${TOP}"/site/zookeeper/

#deploy hadoop
if [ -f "${TOP}"/hadoop-2.5.2.tar.gz ];then
    if [ -f ~/hadoop-2.5.2/ ];then
        rm ~/hadoop-2.5.2/ -rf
    fi
    
    tar -zxvf "${TOP}"/hadoop-2.5.2.tar.gz -C ~/ 
    mv ~/hadoop-2.5.2/ ~/hadoop
    cp "${HADOOP_SITE}"/* ~/hadoop/etc/hadoop/ 
    
fi

#deploy hbase
if [ -f "${TOP}"/hbase-0.99.2-bin.tar.gz ];then
    if [ -f ~/hbase-0.99.2 ];then
        rm ~/hbase-0.99.2/ -rf
    fi
    
    tar -zxvf "${TOP}"/hbase-0.99.2-bin.tar.gz -C ~/ 
    cp "${HBASE_SITE}"/* ~/hbase-0.99.2/conf/ 
fi


#deploy zookeeper 
if [ -f "${TOP}"/zookeeper-3.4.6.tar.gz ];then
    if [ -f ~/zookeeper-3.4.6/ ];then
        rm ~/zookeeper-3.4.6/ -rf 
    fi

    tar -zxvf "${TOP}"/zookeeper-3.4.6.tar.gz -C ~/ 
    cp "${ZOOKEEPER_SITE}"/* ~/zookeeper-3.4.6/conf/
fi 

#install jdk1.7


