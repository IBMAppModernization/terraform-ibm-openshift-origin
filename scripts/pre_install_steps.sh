#!/bin/sh
ips=$(echo $1 | tr "," "\n")
hostnames=$(echo $2 | tr "," "\n")
ips_master=$(echo $3 | tr "," "\n")
domain=$(echo $4)
rm -f ~/.ssh/known_hosts
for i in $ips
do
  ssh-keyscan $i  >> ~/.ssh/known_hosts
  scp /etc/hosts root@$i:/etc/hosts
  ssh root@$i 'bash -s' < /tmp/scripts/update_nodes.sh
done

for i in $ips_master
do
  ssh root@$i 'bash -s' < /tmp/scripts/update_master.sh
done

for i in $hostnames
do
  ssh-keyscan $i  >> ~/.ssh/known_hosts
done
for i in $hostnames
do
  ssh-keyscan $i.$domain  >> ~/.ssh/known_hosts
done
