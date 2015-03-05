#!/usr/bin/env python
#  Filename: ssh.py
#   Created: 2015-03-03 20:18:23
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


import pexpect



def ssh_cmd(ip,user,passwd,cmd):
    ret = -1;
    #ssh = pexpect.spawn('ssh lb@%s "%s"' %(ip,cmd))
    ssh = pexpect.spawn('ssh %s@%s "%s"' %(user, ip, cmd))
#    ssh = pexpect.spawn('ssh lb@192.168.31.246 "touch lbtest.c"')
    try:
        print "go-------"
        i = ssh.expect(['password: ','continue connecting (yes/no)?'],timeout=5)
        print i
        #print ssh.read()
        if i == 0:
            print "yes is 00000"
            ssh.sendline(passwd)
	       # ssh.interact()
            ssh.sendline(cmd)
        elif i== 1:
            ssh.sendline('yes\n')
            ssh.expect('password: ')
            ssh.sendline(passwd)
            ssh.sendline(cmd)
            r=ssh.read()
            print r
            ret = 0
#	    ssh.interact()
    except pexpect.EOF:
        print "EOF"
        ssh.close()
        ret=-1
    except pexpect.TIMEOUT:
        print "TIMEOUT"
        ssh.close()
        ret=-2
    return ret



if __name__=="__main__":
    print '---------start---------'
    #ssh_cmd('192.168.40.47','hadoop','lb','touch aaaaaaaaaaa.c')
    ssh_cmd('192.168.40.244','root','root','touch aaaaaaaaaaa.c')
