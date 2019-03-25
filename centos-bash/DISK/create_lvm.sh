#!/usr/bin/env bash

/sbin/fdisk /dev/vdb

yum install -y lvm2

pvcreate /dev/vdb1

vgcreate vg0 /dev/vdb1 -s 64M

lvcreate -L 190G -n lv1 vg0

mkfs.xfs /dev/vg0/lv1

mkdir /data

mount /dev/vg0/lv1 /data
