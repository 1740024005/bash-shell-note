
|||total|used|free|shared|buff/cache|available|
|-|-|-|-|-|-|-|-|
||Mem:|49279544|13018512|9629352|3480|26631680|35549052|
||Swap:|24772604|132|24772472|||

total： 总物理内存
used： 已使用内存，一般情况这个值会比较大，因为这个值包括了cache+应用程序使用的内存
free： 完全未被使用的内存
shared： 应用程序共享内存
buffers： 缓存，主要用于目录方面,inode值等（ls大目录可看到这个值增加）
cached： 缓存，用于已打开的文件


echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
demoregistry.dataman-inc.com/octopus/centos7-openjdk8-octopus_executor
