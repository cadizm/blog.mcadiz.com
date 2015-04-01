---
layout: post
title: "CentOS(ish) Static IP"
date: Wed Jul 23 15:00:42 PDT 2014
---

    # /etc/resolv.conf
    domain foo.bar.com
    nameserver 10.10.10.12
    nameserver 10.10.10.11

&nbsp;

    # /etc/sysconfig/network
    NETWORKING=yes
    HOSTNAME=pi
    GATEWAY=10.10.10.1

&nbsp;

    # /etc/sysconfig/network-scripts/ifcfg-eth0 
    DEVICE=eth0
    #BOOTPROTO=dhcp
    BOOTPROTO=static
    HWADDR="aa:bb:cc:11:22:33"
    IPADDR=10.10.11.215
    NETMASK=255.255.248.0
    ONBOOT=yes
    GATEWAY=10.10.10.1

&nbsp;

    $ rm /etc/udev/rules.d/70-persistent-net.rules && reboot
