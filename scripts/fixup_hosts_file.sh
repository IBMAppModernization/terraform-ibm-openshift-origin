#!/bin/sh

# Remove entries mapping hostname to localhost
sed -i "/^127\.0\.0\.1.*`hostname`*/d" /etc/hosts
sed -i "/^::1.*`hostname`*/d" /etc/hosts
