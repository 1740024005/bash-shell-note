# 安装 VNC-SERVER

## 1.安装 X-WINDOWS
```
  yum check-update
  yum groupinstall "X Window System" -y
  yum install gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts -y  

  ### 设置默认启动图形界面
  unlink /etc/systemd/system/default.target
  ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

  ### 重启
  reboot
```

## 2.安装 VNC-SERVER配置
```
    yum install tigervnc-server -y

    ### 修改配置文件
    cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service

    ### 将<USER>替换成用户
    ExecStart=/sbin/runuser -l <USER> -c "/usr/bin/vncserver %i"
    PIDFile=/home/<USER>/.vnc/%H%i.pid

    ### 系统重载
    systemctl daemon-reload

    ### 默认启动 & 启动
    sudo systemctl enable vncserver@:1.service
    sudo systemctl start vncserver@:1.service
```
