* [1.语法示例](#1)

* [1.1图片](#1.1)

* [1.2换行](#1.2)

* [1.3强调](#1.3)


```
virt-clone -o centos7_1 -n centos7_2 -f /data/vmdisk/linux_vm2.qcow2

virsh autostart node_name

virsh edit vm1-clone

yum -y install acpid 关闭虚拟机

virsh setmem vm1-clone 1048432

```

# KVM network type
```
# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.000c29b471dc       no              ens32
                                                        vnet0
virbr0          8000.5254007fa6fd       yes             virbr0-nic

# virsh net-list --all
Name                 State      Autostart     Persistent
----------------------------------------------------------
default              active     yes           yes
```
### 1. Virtual Bridge --- 虚拟网桥



添加虚拟网桥
```
# vi /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
TYPE=Bridge
BOOTPROTO=static
BROADCAST=10.1.1.255
IPADDR=10.1.1.11
NETMASK=255.255.255.0
GATEWAY=10.1.1.2
DNS1=10.1.1.2
ONBOOT=yes
```
更改网卡指向
```
# vi /etc/sysconfig/network-scripts/ifcfg-ens32
DEVICE=ens32
BOOTPROTO=none
ONBOOT=yes
BRIDGE=br0
```
关闭宿主机的GSO与TSO功能
```
# ethtool -K eth0 gso off
# ethtool -K eth0 tso off
```
重启网络
```
# systemctl restart network.service
```


### 2. User Networking --- 用户网络

### 3. Host-only --- 隔离模式
