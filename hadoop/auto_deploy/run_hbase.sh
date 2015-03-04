#!/usr/bin/env bash
#  Filename: scp.sh
#   Created: 2015-02-11 19:10:59
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


tmp=$1



ssh hadoop@SLOT-05 "cd ~/hbase-0.99.2; ./bin/${tmp}"
#ssh hadoop@SLOT-06 "cd ~/hbase-0.99.2; ./bin/${tmp}"
#ssh hadoop@SLOT-07 "cd ~/hbase-0.99.2; ./bin/${tmp}"
#ssh hadoop@SLOT-08 "cd ~/hbase-0.99.2; ./bin/${tmp}"



