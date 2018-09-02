## KVM virsh console cann't connect vm

```
# echo "ttyS0" >> /etc/securetty
# grubby --update-kernel=ALL --args="console=ttyS0"
# echo "S0:12345:respawn:/sbin/agetty ttyS0 115200" >> /etc/inittab
# reboot
```
<graphics type='vnc' port='-1' autoport='yes' listen='0.0.0.0'>
  <listen type='address' address='0.0.0.0'/>
</graphics>
