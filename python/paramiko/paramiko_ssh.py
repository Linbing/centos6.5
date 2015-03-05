#!/usr/bin/python
#  Filename: paramiko_ssh.py
#   Created: 2015-03-04 22:25:06
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: semptian


import paramiko 
import threading

def ssh_run(ip, username, passwd, cmd):
    try:
        ssh=paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip,22,username,passwd,timeout=5)
#        ssh.exec_command(cmd)
#        stdin,stdout,stderr=ssh.exec_command(cmd)
#        stdin.write("Y")
#        out=stdout.readline()
#        print out
        for m in cmd:
            stdin,stdout,stderr=ssh.exec_command(m)
            stdin.write("Y")
            out=stdout.readline()
            #for o in out:
            print out
        print '%s\tOK\n'%(ip)
        ssh.close()
    except:
        print '%s\tError\n'%(ip)




if __name__=="__main__":
    cmd=['touch aaa.ccc']
    username="hadoop"
    passwd="lb"
    threads=[]
    ip_a=['46','225','226','227']
    #ip='192.168.40.46'
    for i in ip_a:
        ip='192.168.40.'+str(i)
        #print ip
        #a=threading.Thread(target=ssh_run,args=(ip,username,passwd,cmd))
        #a.start()

    #a=threading.Thread(target=ssh_run,args=('192.168.40.244','root','root',cmd))
    #a=threading.Thread(target=ssh_run,args=('192.168.40.47','hadoop','lb',cmd))
    #a.start()
