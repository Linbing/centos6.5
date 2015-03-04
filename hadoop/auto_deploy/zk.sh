#!/usr/bin/env bash
#  Filename: scp.sh
#   Created: 2015-02-11 19:10:59
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian




#ssh hadoop@s3 "tar -zxvf 69-hadoop.tar.gz && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"

#rm
ssh hadoop@SLOT-05 "rm ~/zookeeper/ -rf"
ssh hadoop@SLOT-06 "rm ~/zookeeper/ -rf"
ssh hadoop@SLOT-07 "rm ~/zookeeper/ -rf"
ssh hadoop@SLOT-08 "rm ~/zookeeper/ -rf"
ssh hadoop@s1 "rm ~/zookeeper/ -rf"


#mkdir 
ssh hadoop@SLOT-05 "mkdir -p ~/zookeeper;cd ~/zookeeper/; echo 1 >> myid"
ssh hadoop@SLOT-06 "mkdir -p ~/zookeeper;cd ~/zookeeper/; echo 2 >> myid"
ssh hadoop@SLOT-07 "mkdir -p ~/zookeeper;cd ~/zookeeper/; echo 3 >> myid"
ssh hadoop@SLOT-08 "mkdir -p ~/zookeeper;cd ~/zookeeper/; echo 4 >> myid"
ssh hadoop@s1 "mkdir -p ~/zookeeper;cd ~/zookeeper/; echo 4 >> myid"
