#!/usr/bin/env python
#  Filename: ssh.py
#   Created: 2015-03-03 20:18:23
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


import pexpect



def ssh_cmd(action,ip,user,passwd,cmd,file):
    ret = -1;
    if action == "ssh":
        print 'ssh: cmd is : ' + cmd
        #ssh = pexpect.spawn('ssh %s@%s "%s"' %(user, ip, cmd))
    if action == "scp":
        print 'scp: file is : ' + file
        #ssh = pexpect.spawn('scp %s %s@%s:~ ' %(file, user, ip))
    ssh = pexpect.spawn('ssh-keygen -t rsa -f /home/hadoop/lb/.ssh/id_rsa -P linbing')
    try:
        i = ssh.expect(['password: ','continue connecting (yes/no)?','Overwrite'],timeout=5)
        if i == 0:
            ssh.sendline(passwd)
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
	elif i == 2:
	    print "-------------"
	    ssh.sendline('yes\n')
	    print i
#	    ssh.sendline('/home/hadoop/lb/.ssh/id_rsa')
	    #Enter passphrase (empty for no passphrase):
#	    j=ssh.expect(['Enter','save','passphrase','no'],timeout=5)
#	    k=ssh.read()
#            print k
    except pexpect.EOF:
       # print "EOF"
        ssh.close()
        ret=-1
    except pexpect.TIMEOUT:
        print "TIMEOUT"
        ssh.close()
        ret=-2
    return ret



if __name__=="__main__":
    ips=['229']
    user="hadoop"
    passwd="lb"
    cmd=["ssh-keygen -t rsa"]
    files=["/home/hadoop/.ssh/id_rsa.pub"]
    #scp 
    for i in ips:
        ip="192.168.40."+ str(i)
        #for file in files:
        #    ssh_cmd("scp",ip,user,passwd,"null",file)
   
    #ssh cmd
    for i in ips:
        ip="192.168.40."+ str(i)
        for c in cmd:
            ssh_cmd("ssh",ip,user,passwd,c,"null")

