# Install Docker Docker-compose

### 安装依赖
```
yum -y install epel-release yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
```
### 安装pip Docker
```
  yum -y install python-pip docker-ce
```
### 安装Docker-compose
```
pip install docker-compose -i https://pypi.douban.com/simple/
```

### 配置docker
```
gpasswd -a [user] docker
--registry-mirror=https://53mhb806.mirror.aliyuncs.com
--insecure-registry=192.168.31.34
```

yum remove docker firewalld iptables

yum install -y NetworkManager NetworkManager-team NetworkManager-tui NetworkManager-wifi dhclient dracut-network initscripts iproute kbd kexec-tools plymouth plymouth-scripts
