#!/bin/sh
echo "Execute the pre-install steps"
#subscription-manager repos --enable="rhel-7-server-rpms"  --enable="rhel-7-server-extras-rpms"   --enable="rhel-7-server-optional-rpms"
#rm -fr /var/cache/yum/*
#yum clean all
#yum -y update
yum install -y wget vim-enhanced net-tools bind-utils tmux iptables-services bridge-utils  centos-release-openshift-origin311 epel-release docker git pyOpenSSL
#yum install -y wget vim-enhanced net-tools bind-utils tmux iptables-services bridge-utils  epel-release docker git pyOpenSSL
sed -i s/NM_CONTROLLED=no/NM_CONTROLLED=yes/g /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i s/NM_CONTROLLED=no/NM_CONTROLLED=yes/g /etc/sysconfig/network-scripts/ifcfg-eth1
systemctl enable NetworkManager
systemctl start NetworkManager
