#!/usr/bin/env bash
#  Filename: scp.sh
#   Created: 2015-02-11 19:10:59
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


#rm
ssh hadoop@SLOT-05 "cd ~/zookeeper-3.4.6; ./bin/zkServer.sh start"
ssh hadoop@SLOT-06 "cd ~/zookeeper-3.4.6; ./bin/zkServer.sh start"
ssh hadoop@SLOT-07 "cd ~/zookeeper-3.4.6; ./bin/zkServer.sh start"
ssh hadoop@SLOT-08 "cd ~/zookeeper-3.4.6; ./bin/zkServer.sh start"
ssh hadoop@s1 "cd ~/zookeeper-3.4.6; ./bin/zkServer.sh start"



