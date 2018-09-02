# SELinux

#### 查看SELinux状态:
```
/usr/sbin/sestatus -v
SELinux status:                 disabled
```

#### 关闭SELinux:
```
#临时处理(不用重启机器)
setenforce 0
0 disabled
1 enforcing
2 permissive

#修改配置文件(需要重启机器)
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
reboot
```
