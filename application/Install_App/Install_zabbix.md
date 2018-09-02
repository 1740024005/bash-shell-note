### Setp 1：get rpm & install
```
    curl -O http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm

    rpm -ivh zabbix-release-3.4-2.el7.noarch.rpm
```
### Sept 2：install with yum & start
```
    yum install zabbix-agent -y
    yum install zabbix-server-mysql zabbix-web-mysql zabbix-agent mariadb mariadb-libs mariadb-devel mariadb-server -y
```
### Sept 3：edit config
```
    mysql << EOF

        create database zabbix character set utf8 collate utf8_bin;

        grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';

        quit

        EOF
    zcat /usr/share/doc/zabbix-server-mysql-3.4.1/create.sql.gz | mysql -uzabbix -p zabbix
    sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/g' /etc/php.ini
```
### Sept 4：start & enable
```
    systemctl enable mariadb && systemctl enable zabbix-agent && systemctl enable zabbix-server && systemctl enable httpd
    systemctl start mariadb && systemctl start zabbix-agent && systemctl start zabbix-server && systemctl start httpd

```
Done

Zabbix Info

    http://IP/zabbix/index.php
    user Admin
    password zabbix
