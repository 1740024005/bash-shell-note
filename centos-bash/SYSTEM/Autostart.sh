# /etc/init.d/

#!/bin/bash
# chkconfig: - 85 15
# description: auto add netmask and default gw
ifconfig eth0 192.168.31.22 netmask 255.255.255.0
route add default gw 192.168.31.1
pri
