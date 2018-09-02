# KVM 安装


#### 1.关闭 SElinux 防火墙
[关闭SElinux](https://github.com/1740024005/Bash-Shell/blob/master/CentOS%20Bash/SYSTEM/SElinux.md)

关闭防火墙
```
# systemctl stop firewalld.service
# systemctl stop iptables.service
# systemctl disable NetworkManager.service
```

#### 2.安装kvm
验证CPU是否支持kvm
```
# egrep '(vmx|svm)' /proc/cpuinfo
```
安装kvm
```
# yum -y install kvm libvirt libvirt-devel qemu-kvm virt-viewer bridge-utils virt-top libguestfs-tools ca-certificates audit-libs-python device-mapper-libs virt-install
```

#### 3.验证kvm安装
```
# lsmod | grep kvm
```
kvm启动/开机自启动
```
# systemctl start libvirtd.service
# systemctl enable libvirtd.service
```

#### 4.安装虚拟机
准备系统镜像文件
创建文件存放的目录
```
# mkdir -p /data/vmdisk
```
虚拟机存储池 -- 创建 启动 查看 删除
```
# virsh pool-define-as vmDiskPool --type dir --target /data/vmdisk
Pool vmDiskPool defined

# virsh pool-build vmDiskPool
Pool vmDiskPool built

# virsh pool-autostart vmDiskPool
Pool vmDiskPool marked as autostarted

# virsh pool-start vmDiskPool
Pool vmDiskPool started

# virsh pool-list --all
Name                 State      Autostart
-------------------------------------------
vmDiskPool           inactive   yes

# virsh pool-info vmDiskPool
Name:           vmDiskPool
UUID:           29cf75f3-35ad-472c-9d75-8930fa8d4ca9
State:          inactive
Persistent:     yes
Autostart:      yes

# virsh pool-destroy vmDiskPool
Pool vmDiskPool destroyed

# virsh pool-delete vmDiskPool
Pool vmDiskPool deleted

# virsh pool-undefine vmDiskPool
Pool vmDiskPool has been undefined
```
在存储池中虚拟机 存储卷 创建 删除
```
# virsh vol-create-as vmDiskPool linux_vm1.qcow2 20G --format qcow2
Vol linux_vm1.qcow2 created

# virsh vol-delete --pool vmDiskPool linux_vm1.qcow2
Vol linux_vm1.qcow2 deleted
```

安装虚拟机
```
bridge网络模式
# virt-install --os-type=linux --os-variant=RHEL6 --name=linux --ram 512 --vcpus 1,maxcpus=8 --vcpus sockets=1,cores=1,threads=2 --disk path=/data/vmdisk/linux_vm1.qcow2,format=qcow2,bus=virtio -c /opt/data/iso/CentOS-6.3-x86_64-bin-DVD1.iso --graphics vnc,listen=0.0.0.0,port=5920, --network bridge=br0,model=virtio --force --accelerate --autostart --boot cdrom,hd,menu=on

NAT网络模式
# virt-install --name=test --ram 512 --vcpus=1 -f /data/kvm/vm/test.qcow2 --cdrom /data/iso/CentOS-6.5-x86_64-bin-DVD1.iso --graphics vnc,listen=0.0.0.0,port=5988, --network network=default,model=virtio --force --accelerate --autostart --boot cdrom,hd,menu=on

安装window主机
# virt-install --name=window_24 --ram 12288 --vcpus 4 -c /data/iso/windows2008.iso --disk path=/usr/share/virtio-win/virtio-win-1.5.2.iso,device=cdrom --disk path=/data/kvm/vm/window_24.img,format=qcow2,bus=virtio --network bridge=br0,model=virtio --vnc --vncport=5924 --vnclisten=0.0.0.0 --force --autostart --os-type=windows --accelerate --boot cdrom,hd,menu=on
```
