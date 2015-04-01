---
layout: post
title: "VirtualBox Bridged Network Adapter"
date: Fri Aug 22 14:53:29 PDT 2014
---

To ssh into it a virtualbox vm, set up bridged networking:

1. Add a bridged adapter similar to [this](/images/bridged_adapter.png)

2. Spin up your vm and look for the new interface. In my case the interface was not
configured automatically:

    ```
    $ ifconfig -a
    eth2      Link encap:Ethernet  HWaddr 08:00:27:2D:73:70  
              BROADCAST MULTICAST  MTU:1500  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
              Interrupt:16 Base address:0xd240 
    ```

3. To set up via dhcp, kill any dhclient processes that may attached
to the interface and then restart:

    ```
    $ kill $(lsof -tc dhclient)
    $ dhclient eth2
    ```

4. Assuing dhclient succeeded, you can now find out the ip address assigned:

    ```
    $ifconfig -a
    eth2      Link encap:Ethernet  HWaddr 08:00:27:2D:73:70  
              inet addr:10.10.11.163  Bcast:10.10.15.255  Mask:255.255.248.0
              inet6 addr: fe80::a00:27ff:fe2d:7370/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:34244 errors:15 dropped:0 overruns:0 frame:0
              TX packets:477 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:2268686 (2.1 MiB)  TX bytes:60728 (59.3 KiB)
              Interrupt:16 Base address:0xd240 
    ```

5.  To have the interface configured at boot, in the vm:

    ```
    $ cd /etc/sysconfig/network-scripts
    $ cp ifcfg-eth0  ifcfg-eth2
    $ sed -i 's/eth0/eth2/g' ifcfg-eth2
    ```

6. Back on the host OS, you can now:

    ```
    $ ssh 10.10.11.163
    ```
