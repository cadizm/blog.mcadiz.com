---
layout: post
title: "YubiKey All The Things"
date: Fri Sep 29 20:21:59 PDT 2017
---

Mostly notes to self, extracted from the very thorough guide [here](https://github.com/drduh/YubiKey-Guide/blob/master/README.md).

```bash
l0st:~$ gpg --recv 0x210583A0ECB0AFA4
gpg: key 0x210583A0ECB0AFA4: public key "Michael Cadiz <mike@cadizm.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1

l0st:~$ gpg --card-status
Reader ...........: Yubico Yubikey 4 OTP U2F CCID
Application ID ...: D2760001240102010006064714440000
Version ..........: 2.1
Manufacturer .....: Yubico
Serial number ....: 06471444
Name of cardholder: Michael Cadiz
Language prefs ...: en
Sex ..............: unspecified
URL of public key : [not set]
Login data .......: mike@cadizm.com
Signature PIN ....: not forced
Key attributes ...: rsa2048 rsa2048 rsa2048
Max. PIN lengths .: 127 127 127
PIN retry counter : 3 0 3
Signature counter : 0
Signature key ....: 937F C389 F454 379B 0AFA  91B7 FFFC 7132 9711 5C2D
      created ....: 2017-09-30 00:56:00
Encryption key....: AE92 FBF9 2649 FA40 6B8E  7E0F 601C 0549 9658 64FF
      created ....: 2017-09-30 00:56:43
Authentication key: 8CDF 1B3D 174B 9516 AFFC  127A 6E4E 403F 1B48 9938
      created ....: 2017-09-30 00:57:04
General key info..: sub  rsa2048/0xFFFC713297115C2D 2017-09-30 Michael Cadiz <mike@cadizm.com>
sec#  rsa2048/0x210583A0ECB0AFA4  created: 2017-09-30  expires: never
ssb>  rsa2048/0xFFFC713297115C2D  created: 2017-09-30  expires: never
                                  card-no: 0006 06471444
ssb>  rsa2048/0x601C0549965864FF  created: 2017-09-30  expires: never
                                  card-no: 0006 06471444
ssb>  rsa2048/0x6E4E403F1B489938  created: 2017-09-30  expires: never
                                  card-no: 0006 06471444

l0st:~$ gpg --list-keys
/Users/mcadiz/.gnupg/pubring.kbx
--------------------------------
pub   rsa2048/0x210583A0ECB0AFA4 2017-09-30 [SC]
      Key fingerprint = 204E 949F 17A5 B8EF E8DB  0571 2105 83A0 ECB0 AFA4
uid                   [ unknown] Michael Cadiz <mike@cadizm.com>
sub   rsa2048/0xFFFC713297115C2D 2017-09-30 [S]
sub   rsa2048/0x601C0549965864FF 2017-09-30 [E]
sub   rsa2048/0x6E4E403F1B489938 2017-09-30 [A]

l0st:~$ gpg --edit-key 0x210583A0ECB0AFA4
gpg (GnuPG) 2.2.1; Copyright (C) 2017 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

pub  rsa2048/0x210583A0ECB0AFA4
     created: 2017-09-30  expires: never       usage: SC
     trust: unknown       validity: unknown
ssb  rsa2048/0xFFFC713297115C2D
     created: 2017-09-30  expires: never       usage: S
     card-no: 0006 06471444
ssb  rsa2048/0x601C0549965864FF
     created: 2017-09-30  expires: never       usage: E
     card-no: 0006 06471444
ssb  rsa2048/0x6E4E403F1B489938
     created: 2017-09-30  expires: never       usage: A
     card-no: 0006 06471444
[ unknown] (1). Michael Cadiz <mike@cadizm.com>

gpg> trust
pub  rsa2048/0x210583A0ECB0AFA4
     created: 2017-09-30  expires: never       usage: SC
     trust: unknown       validity: unknown
ssb  rsa2048/0xFFFC713297115C2D
     created: 2017-09-30  expires: never       usage: S
     card-no: 0006 06471444
ssb  rsa2048/0x601C0549965864FF
     created: 2017-09-30  expires: never       usage: E
     card-no: 0006 06471444
ssb  rsa2048/0x6E4E403F1B489938
     created: 2017-09-30  expires: never       usage: A
     card-no: 0006 06471444
[ unknown] (1). Michael Cadiz <mike@cadizm.com>

Please decide how far you trust this user to correctly verify other users' keys
(by looking at passports, checking fingerprints from different sources, etc.)

  1 = I don't know or won't say
  2 = I do NOT trust
  3 = I trust marginally
  4 = I trust fully
  5 = I trust ultimately
  m = back to the main menu

Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y

pub  rsa2048/0x210583A0ECB0AFA4
     created: 2017-09-30  expires: never       usage: SC
     trust: ultimate      validity: unknown
ssb  rsa2048/0xFFFC713297115C2D
     created: 2017-09-30  expires: never       usage: S
     card-no: 0006 06471444
ssb  rsa2048/0x601C0549965864FF
     created: 2017-09-30  expires: never       usage: E
     card-no: 0006 06471444
ssb  rsa2048/0x6E4E403F1B489938
     created: 2017-09-30  expires: never       usage: A
     card-no: 0006 06471444
[ unknown] (1). Michael Cadiz <mike@cadizm.com>
Please note that the shown key validity is not necessarily correct
unless you restart the program.

gpg> quit

l0st:~$ gpg --list-keys
gpg: checking the trustdb
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
/Users/mcadiz/.gnupg/pubring.kbx
--------------------------------
pub   rsa2048/0x210583A0ECB0AFA4 2017-09-30 [SC]
      Key fingerprint = 204E 949F 17A5 B8EF E8DB  0571 2105 83A0 ECB0 AFA4
uid                   [ultimate] Michael Cadiz <mike@cadizm.com>
sub   rsa2048/0xFFFC713297115C2D 2017-09-30 [S]
sub   rsa2048/0x601C0549965864FF 2017-09-30 [E]
sub   rsa2048/0x6E4E403F1B489938 2017-09-30 [A]

l0st:~$ ssh-add -L
The agent has no identities.
l0st:~$ pkill ssh-agent && pkill gpg-agent && eval $(gpg-agent --daemon --enable-ssh-support  --log-file ~/.gnupg/gpg-agent.log)
l0st:~$ ssh-add -L
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5xxrkhC2MnXO2HJzJL7kFPhE71pejZMNZ8SwYDMlQoRCnuvNZ9eDy+ped+nCO+SEyNcMlike6clG6/iepfXNteqpaM4mmH9UyKmbdVLr3Vks1dMUI9TL9DHzIe7KvogmHdV+Fg30m13pKbknFES7HGBjAV6U8EXteT4v17dSZ/P2B3l4EdmTAtgWfsQnSEecd5SKVWpdOovL/h67W4zrgTKcQZB5h3sW7TyPSSgEF30Bdt8gv8/nZJtv2husSZaIRzm7V4Y3ikP1Lh3QdSQenTAjcWRRh/X+9ueXyc5zqGQu/i+PPriZIdIqN2T+ql5FXTdni5W4Se0Fhm7SvHVwd cardno:000606471444
```
