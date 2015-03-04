#!/usr/bin/python
#  Filename: run_shell.py
#   Created: 2015-03-03 20:08:56
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian



import commands
import pprint



def run_cmd(cmd_line):
    return commands.getstatusoutput(cmd_line)


if __name__=="__main__":
    pprint.pprint(run_cmd("ls -la"))
