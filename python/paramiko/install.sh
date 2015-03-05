#!/usr/bin/env bash
#  Filename: install.sh
#   Created: 2015-03-04 06:32:07
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian




#wget http://www.lag.net/paramiko/download/paramiko-1.7.7.1.tar.gz
#wget http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.4.1.tar.gz
#sudo yum install python-devel.x86_64
#sudo apt-get install python-dev 
function install()
{   
    name=$1
    dest=${name}.tar.gz
    tar -zxvf ${dest}
    cd $1
    sudo python ./setup.py install
    cd -
    sudo rm $1 -rf

}


if [ -f pycrypto-2.4.1.tar.gz ];then
    install pycrypto-2.4.1
else
    wget http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.4.1.tar.gz
    install pycrypto-2.4.1
fi

if [ -f paramiko-1.7.7.1.tar.gz ];then
   install paramiko-1.7.7.1
else
    wget http://www.lag.net/paramiko/download/paramiko-1.7.7.1.tar.gz 
    install paramiko-1.7.7.1
fi
