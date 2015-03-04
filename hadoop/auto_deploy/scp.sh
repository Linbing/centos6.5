#!/usr/bin/env bash
#  Filename: scp.sh
#   Created: 2015-02-11 19:10:59
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian



tmp=$1


scp $1 hadoop@SLOT-05:~
scp $1 hadoop@SLOT-06:~
scp $1 hadoop@SLOT-07:~
scp $1 hadoop@SLOT-08:~
scp $1 hadoop@s1:~
scp $1 hadoop@s2:~

#ssh hadoop@s3 "tar -zxvf 69-hadoop.tar.gz && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
ssh hadoop@SLOT-05 "tar -zxvf ${tmp} && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
ssh hadoop@SLOT-06 "tar -zxvf ${tmp} && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
ssh hadoop@SLOT-07 "tar -zxvf ${tmp} && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
ssh hadoop@SLOT-08 "tar -zxvf ${tmp} && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
ssh hadoop@s1 "tar -zxvf ${tmp} && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
ssh hadoop@s2 "tar -zxvf ${tmp} && cd ~/semptian-hadoop/deploy && ./auto-deploy.sh;"
