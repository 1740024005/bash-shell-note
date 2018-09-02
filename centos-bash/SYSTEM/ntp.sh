#!/bin/bash
abc="2 21 22 23 24 3 31 32 34 4 41 42 44 45 46 5 51 52 53 54 6 7"
for i in ${abc};
do
echo 192.168.31.$i
ssh root@192.168.31.$i "/usr/sbin/ntpdate 182.92.12.11"
done
