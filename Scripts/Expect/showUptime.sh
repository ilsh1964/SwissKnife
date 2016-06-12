#!/bin/sh
#show all actives calls on asterix server
for x in `cat ip.lst `;do ./ssh.expect_uptime $x |head -n 5 |tail -n 1 | awk -v ip=$x '{print ip_"uptime="$1}' ;done > /tmp/calls.txt
