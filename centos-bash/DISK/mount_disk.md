# 硬盘挂载

#### ----------------------------------------------------------------------------------------------------------------------------
### 查看是否有新硬盘添加:

```
  [root@localhost ~]# fdisk -l | grep Disk
  Disk /dev/vda: 17.2 GB, 17179869184 bytes, 33554432 sectors
  Disk label type: dos
  Disk identifier: 0x000d4ea4
  Disk /dev/mapper/cl-root: 15.0 GB, 15023996928 bytes, 29343744 sectors
  Disk /dev/mapper/cl-swap: 1073 MB, 1073741824 bytes, 2097152 sectors
  Disk /dev/vdb: 0 MB, 197120 bytes, 385 sectors
```

找到新添加的磁盘的编号为 /dev/vdb

#### ----------------------------------------------------------------------------------------------------------------------------
### 磁盘分区

#### 1. 进入分区模式:   
  选中刚才新添加的硬盘 -- /dev/vdb

```
  [root@localhost ~]# /sbin/fdisk /dev/vdb
  Welcome to fdisk (util-linux 2.23.2).

  Changes will remain in memory only, until you decide to write them.
  Be careful before using the write command.

  Device does not contain a recognized partition table
  Building a new DOS disklabel with disk identifier 0x284f1bdb.
  You must set cylinders.
  You can do this from the extra functions menu.

  Command (m for help): n
```
  n 进入分区模式
```
  Partition type:
    p   primary (0 primary, 0 extended, 4 free)
    e   extended
  Select (default p): 
```
  选择分区类型 --- p 主分区-max_count 4 (默认) e 扩展分区-max_count 1
```
  Using default response p
  Partition number (1-4, default 1): 
```
  选择分区数 默认1
```
  First sector (2048-41943039, default 2048): 
  Using default value 2048
```
  选择开始柱面 默认
```
  Last sector, +sectors or +size{K,M,G} (2048-41943039, default 41943039): 
  Using default value 41943039
```
  选择结束柱面 默认
```
  Partition 1 of type Linux and of size 20 GiB is set

  Command (m for help): w
```
  写入分区表
```
  The partition table has been altered!

  Calling ioctl() to re-read partition table.
  Syncing disks.
```

#### 2. 进入格式化模式:
  查看新分区的硬盘：
```
  [root@localhost ~]# ls -al /dev | grep vdb
  brw-rw----   1 root disk      8,  32 Sep  6 20:59 vdb
  brw-rw----   1 root disk      8,  33 Sep  6 20:59 vdb1
```
  格式化分区 (扩展分区只能在逻辑分区上进行格式化)
```
  [root@localhost ~]# mkfs -t xfs /dev/vdb1
  meta-data=/dev/vdb1              isize=512    agcount=4, agsize=1310656 blks
           =                       sectsz=512   attr=2, projid32bit=1
           =                       crc=1        finobt=0, sparse=0
  data     =                       bsize=4096   blocks=5242624, imaxpct=25
           =                       sunit=0      swidth=0 blks
  naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
  log      =internal log           bsize=4096   blocks=2560, version=2
           =                       sectsz=512   sunit=0 blks, lazy-count=1
  realtime =none                   extsz=4096   blocks=0, rtextents=0
```

####  3. 挂载到目录:
  创建挂载目录：
```
  mkdir /data
```
  挂载
```
  mount /dev/vdb1 /data
```
  设置开机启动挂载
```
  [root@localhost ~]# echo '/dev/vdb1 /data xfs defaults 1 2' >> /etc/fstab
```
