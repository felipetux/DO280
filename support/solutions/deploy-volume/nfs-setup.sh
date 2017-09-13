#!/bin/bash

HOST_MASTER=`hostname`
HOST_NODE=`echo $HOST_MASTER | sed 's/master/node/'`;
sh /root/DO280/labs/deploy-volume/iptables.sh
sed -i '/-A FORWARD -j REJECT --reject-with icmp-host-prohibited/r /root/DO280/labs/deploy-volume/firewall-sysconfig.txt' /etc/sysconfig/iptables
sed -i 's/RPCMOUNTDOPTS=\"\"/RPCMOUNTDOPTS=\"-p 20048\"/g' /etc/sysconfig/nfs
sed -i 's/STATDARG=\"\"/STATDARG=\"-p 50825\"/g' /etc/sysconfig/nfs
setsebool -P virt_use_nfs=true
systemctl enable rpcbind
systemctl start rpcbind
systemctl enable nfs-server
systemctl start nfs-server
ssh root@$HOST_NODE "setsebool -P virt_use_nfs=true"

mkdir -p /var/export/dbvol
chown nfsnobody:nfsnobody /var/export/dbvol
chmod 700 /var/export/dbvol
echo "/var/export/dbvol *(rw,async,all_squash)" >> /etc/exports
exportfs -a

sed "s/master.podX.example.com/$HOSTNAME/g" /root/DO280/labs/deploy-volume/mysqldb-volume.json > /tmp/mysqldb-volume.json
oc login -u system:admin
oc create -f /tmp/mysqldb-volume.json
