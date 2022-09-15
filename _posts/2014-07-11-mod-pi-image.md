---
layout: post
title: "Modify Raspberry Pi Image"
date: Fri Jul 11 17:18:43 PDT 2014
---

[Download](http://www.raspberrypi.org/Downloads) your raspberry image of
choice. In my case I needed the [redsleeve](http://www.redsleeve.org) distro.

```shell
$ fdisk -l raspi-v2-redsleeve-cli-0.3.img

Disk raspi-v2-redsleeve-cli-0.3.img: 1939 MB, 1939865600 bytes
255 heads, 63 sectors/track, 235 cylinders, total 3788800 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00014d34

                         Device Boot      Start         End      Blocks   Id  System
raspi-v2-redsleeve-cli-0.3.img1            8192      122879       57344    c  W95 FAT32 (LBA)
raspi-v2-redsleeve-cli-0.3.img2          122880     3788799     1832960   83  Linux
```

We want to be able to mount/modify the second partition on /mnt. Run:

```shell
$ sudo kpartx -a raspi-v2-redsleeve-cli-0.3.img
```

which should add a loop device in /dev/mapper:

```shell
$ ls /dev/mapper
control  loop0p1@  loop0p2@  root@  swap1@
```

The second partition is now mapped to /dev/mapper/loop0p2. Mount:

```shell
$ sudo mount -o rw /dev/mapper/loop0p2 /mnt
$ cd /mnt
$ ls
bin/  boot/  dev/  etc/  home/  lib/  lost+found/  media/  mnt/  opt/  proc/  root/  sbin/  selinux/  srv/  sys/  tmp/  usr/  var/
```

We can now modify the disk image as we please. Remember to `umount` and
`kpartx -d` when done.

```shell
$ sudo umount /mnt
$ sudo kpartx -d raspi-v2-redsleeve-cli-0.3.img
loop deleted : /dev/loop0
```
