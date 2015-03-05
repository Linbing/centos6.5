#!/usr/bin/env bash
#  Filename: install.sh
#   Created: 2015-03-04 06:12:24
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


if [ -f ./pexpect-2.3.tar.gz ];then
    rm pexpect-2.3.tar.gz
    rm pexpect-2.3 -rf
else
    wget http://jaist.dl.sourceforge.net/project/pexpect/pexpect/Release%202.3/pexpect-2.3.tar.gz
fi

#wget http://jaist.dl.sourceforge.net/project/pexpect/pexpect/Release%202.3/pexpect-2.3.tar.gz


if [ -f ./pexpect-2.3.tar.gz ];then
    tar xzf pexpect-2.3.tar.gz
    cd pexpect-2.3
    sudo python setup.py install
fi

cd -
#sudo rm pexpect-2.3.tar.gz
sudo rm pexpect-2.3 -rf

