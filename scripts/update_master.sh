#!/bin/sh
echo "Execute the pre-install steps on all masters"
#subscription-manager repos --enable="rhel-7-server-rpms"  --enable="rhel-7-server-extras-rpms"   --enable="rhel-7-server-optional-rpms"
#rm -fr /var/cache/yum/*
#yum clean all
#yum -y update
#yum install -y openshift-ansible
yum install -y ansible
git clone https://github.com/openshift/openshift-ansible ~/openshift-ansible
cd  ~/openshift-ansible
git checkout release-3.11
cd -
