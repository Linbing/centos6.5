#!/usr/bin/python
#  Filename: subproc.py
#   Created: 2015-03-04 19:10:36
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


import subprocess



def exe_cmd(cmd):
    ret=subprocess.call([cmd)
    print ret

if __name__=="__main__":
    print '-------'
    exe_cmd("ls")
