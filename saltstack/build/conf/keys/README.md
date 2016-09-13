generate by command "salt-key --gen-key='sls-common-key' "

on minion:
1.copy those 2 files under /etc/salt/pki/minion/ as :
minion.pem  minion.pub
2. change  /etc/salt/minion,  
master: 10.29.113.20
id: sls-common-key

note: sls-common-key  is the same file name on master  /etc/salt/pki/master/minions/sls-common-key

