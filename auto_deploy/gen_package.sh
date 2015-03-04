#!/bin/sh

VERSION=$(git log | grep -cE 'Author:.*<.*@.*>')
ROOT=`pwd`
DEST=semptian-hadoop
HADOOP_ROOT=../../hadoop/hadoop-dist/target
HADOOP_CONF_DIR=../multi-site/hadoop
HIVE_CONF_DIR=../multi-site/hive/
HBASE_CONF_DIR=../multi-site/hbase/
ZOOKEEPER_CONF_DIR=../multi-site/zookeeper/

DEPLOY_DIR=../deploy

HIVE_DIR=../../hive
TOOLS_DIR=../../tools


rm $DEST -rf
mkdir $DEST
mkdir -p $DEST/site

cp $HADOOP_ROOT/hadoop-2.5.2.tar.gz $DEST
cp $HADOOP_CONF_DIR/ $DEST/site -r
cp $HIVE_CONF_DIR/ $DEST/site -r
cp $HBASE_CONF_DIR/ $DEST/site -r
cp $ZOOKEEPER_CONF_DIR/ $DEST/site -r

cp $DEPLOY_DIR/ $DEST -r
#cp $HIVE_DIR/ $DEST -r

cp $TOOLS_DIR/hbase-0.99.2-bin.tar.gz $DEST -r
cp $TOOLS_DIR/zookeeper-3.4.6.tar.gz $DEST -r

#if you needed jdk
#cp $TOOLS_DIR/jdk-7u75-linux-x64.tar.gz $DEST -r


tar -zcvf ${VERSION}-hadoop.tar.gz $DEST/*




