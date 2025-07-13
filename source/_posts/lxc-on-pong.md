---
layout: post
title: 记录为Nothing Phone(2)构建LXC内核
date: 2025-07-13 23:26:17
tags:
- Android
- Kernel
- LXC
- Linux
cover: /img/pong-lxc.jpg
top_img: /img/pong-lxc.jpg
---
# 参考源码：
## Patch：
https://github.com/lateautumn233/Common-Android-Kernel-Tree
## Kernel：
https://github.com/arter97/android_kernel_nothing_sm8475
## Might useful：
https://github.com/xiaoleGun/KernelSU_Action

# 构建：
和我之前的文章几乎差不多，可以看一下[为你的手机内核开启docker支持](https://blog.crack.moe/2022/12/04/moe-docker-lab/)。
pick了参考源码打的补丁，直接构建。
遇到了一个clang已经弃用的参数的问题，貌似还有个werror问题？忘了，总体还算顺利。然后刷了直接用termux跑lxc就是了。
# 运行：
记得挂载cgroup，否则会报错。
```shell
mount -t tmpfs -o mode=755 tmpfs /sys/fs/cgroup
sudo mkdir -p /sys/fs/cgroup/devices
sudo mount -t cgroup -o devices cgroup /sys/fs/cgroup/devices
sudo mkdir -p /sys/fs/cgroup/systemd
sudo mount -t cgroup cgroup -o none,name=systemd /sys/fs/cgroup/systemd
```
如果没网，把lxc.net.0.type改成none就好了。
# 鸣谢：
感谢[Arter97](https://github.com/arter97)的内核源码，感谢[lateautumn233](https://github.com/lateautumn233)提供的源码中的补丁参考。    
# Prebuild：
A prebuilt kernel is available at https://github.com/Moe-sushi/misc/blob/main/np2/magisk_patched-28100_cKsqi.img.   
Tested on NothingOS 3.0 Android 15, works fine.    
~~等下我怎么突然说嘤语了~~