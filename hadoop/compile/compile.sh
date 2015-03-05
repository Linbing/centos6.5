#!/usr/bin/env bash
#  Filename: compile.sh
#   Created: 2015-02-11 21:59:15
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian
cur=`dirname "${BASH_SOURCE-$0}"`

cur=`cd "$cur"; pwd`
TOOLS_DIR="$cur"/../../tools
INSTALL_PATH="/usr/local"
HADOOP_DIR="$cur"/../../hadoop

if [ -f "${cur}"/pre_env.sh ];then
    echo "Starting pre_env.sh"
    "$cur"/pre_env.sh
fi

if [ -d "${TOOLS_DIR}" ]; then
    #install maven 
    if [ -d "${INSTALL_PATH}/apache-maven-3.2.5/" ];then
        echo "you have install maven-3.2.5 in ${INSTALL_PATH},skipping"
    else
        tar -zxvf "${TOOLS_DIR}"/apache-maven-3.2.5-bin.tar.gz -C "${INSTALL_PATH}/"
        echo "export MAVEN_HOME=/usr/local/apache-maven-3.2.5" >> /etc/profile 
        echo "export PATH=$PATH:$MAVEN_HOME/bin" >> /etc/profile 
    fi
    #install ant 
    if [ -d "${INSTALL_PATH}/apache-ant-1.9.4/" ]; then
        echo "you have install ant-1.9.4 in ${INSTALL_PATH},skipping"
    else
        tar -zxvf "${TOOLS_DIR}"/apache-ant-1.9.4-bin.tar.gz -C "${INSTALL_PATH}/"
        echo "export ANT_HOME=/usr/local/apache-ant-1.9.4" >> /etc/profile 
        echo "export PATH=$PATH:$ANT_HOME/bin" >> /etc/profile 
    fi
   #install findbugs
    if [ -d "${INSTALL_PATH}/findbugs-3.0.0/" ]; then
        echo "you have install findbugs-3.0.0 in ${INSTALL_PATH},skipping"
    else
        tar -zxvf "${TOOLS_DIR}"/findbugs-3.0.0.tar.gz -C "${INSTALL_PATH}/"
        echo "export FINDBUGS_HOME=/usr/local/findbugs-3.0.0" >> /etc/profile 
        echo "export PATH=$PATH:$FINDBUGS_HOME/bin" >> /etc/profile 
    fi
   #install jdk1.7 
    if [ -d "${INSTALL_PATH}/jdk1.7.0_75/" ]; then
        echo "you have install jdk1.7.0_75 in ${INSTALL_PATH},skipping"
    else
        tar -zxvf "${TOOLS_DIR}"/jdk-7u75-linux-x64.tar.gz -C "${INSTALL_PATH}/"
        echo "export JAVA_HOME=/usr/local/jdk1.7.0_75" >> /etc/profile 
        echo "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile 
    fi
    #install protobuf
    if [ -d "${INSTALL_PATH}/protobuf-2.5.0/" ]; then
        echo "you have install protobuf-2.5.0 in ${INSTALL_PATH},skipping"
    else
        tar -zxvf "${TOOLS_DIR}"/protobuf-2.5.0.tar.gz -C "${INSTALL_PATH}/"
        cd ${INSTALL_PATH}/protobuf-2.5.0/
        ./configure --prefix=/usr/local
        make && make install 
        cd -
    fi

else
    echo "Warning: Not found tools dir,please checking it in your project "
    exit
fi

cd ../../hadoop

mvn package -Pdist,native -DskipTests -Dtar

#echo $TOOLS_DIR
