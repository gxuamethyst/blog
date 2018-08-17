---
title: "Shadowsocks 服务器搭建"
date: 2018-08-17T14:13:56+08:00
draft: false
tags: ["Shadowsocks"]
---

## 购买一个国外 VPS/服务器

想要自己搭建一个用于代理的 Shadowsocks 服务，首先需要购买一个国外的 VPS (Virtual Private Server 虚拟专用服务器)，国外的主机提供商有很多，比较著名的有 [DigitalOcean](https://www.digitalocean.com/)，[Linode](https://www.linode.com/)，[Vultr](https://www.vultr.com/) 等，服务器相对较为稳定，速度快，但是价格也相对较高。

购买步骤大致如下

1. 到相应的主机提供商官网使用邮箱注册一个账号，或者先根据自己的需求先选择好 VPS，加入购物车，最后付款的时候再创建账号，其中只要邮箱没填错，其他的都可以乱填。

2. 根据自己的需求购买相应配置的 VPS，一般来说，若只是用于做 Shadowsocks 代理，512M 内存的 VPS 已足够。

3. 购买后相应的 VPS 用户名密码将会发到注册的邮箱，当然，有一些主机商是你选择购买的时候就让你填写管理员 (root) 的密码了的，需要记得这个密码，后面 SSH 登录 VPS 需要用到。

一般来说，使用那些所谓的亚洲优化/中国优化线路的 VPS 在使用时将会有速度的优势/提升，而我们购买 VPS 一般选择美国西海岸的比如洛杉矶的 VPS，当然，能买到香港的 VPS 更好，但是价格更贵。

购买之前可以查看主机商官网上是否有用来进行速度测试的 IP，ping 一下这个 IP 看速度如何再决定是否购买，一般来说 ping 值在 150ms 左右 都可以接受。

![ping](/images/ping.png)

购买前可以到 [国外主机测评](https://www.zhujiceping.com/) 这个网站上查看最近有什么主机商搞活动/优惠，优惠码，主机商 VPS 评测等等，一般可以选择购买 [DigitalOcean](https://www.digitalocean.com/)，[Linode](https://www.linode.com/)，[Vultr](https://www.vultr.com/) 这几家的 VPS，均价 5 美元/月，或者选择 [hostdare](https://manage.hostdare.com) 这家主机商的 VPS，其中的 [Premium China Optimized Openvz linux vpses](https://manage.hostdare.com/cart.php?gid=15) 款较为便宜 (使用 国外主机测评 上的优惠码)。

## 部署 Shadowsocks 服务端

购买好国外的 VPS 之后，需要在 VPS 上部署 Shadowsocks 服务器端才能供我们进行代理。使用 [MobaXterm](https://mobaxterm.mobatek.net/download.html) 或者 Xshell 等 SSH 登录工具登录，执行如下的几个命令 (一键安装脚本) 根据提示进行安装即可

``` shell
wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-libev-debian.sh
chmod +x shadowsocks-libev-debian.sh
./shadowsocks-libev-debian.sh 2>&1 | tee shadowsocks-libev-debian.log
```

安装完成之后，脚本提示如下，根据如下配置信息配置对应的客户端即可。

``` shell
Congratulations, shadowsocks-libev install completed!
Your Server IP:your_server_ip
Your Server Port:your_server_port
Your Password:your_password
Your Local IP:127.0.0.1
Your Local Port:1080
Your Encryption Method:aes-256-cfb

Welcome to visit:http://teddysun.com/357.html
Enjoy it!
```

注意，关于端口，若此 VPS 上其他程序不需要使用 443 端口，可以将 Shadowsocks 使用的端口指定为 443

加密方式可以选择 (建议) xchacha20-ietf-poly1305

密码请尽量设置强度较高的密码

以上安装命令/脚本来源自 [shadowsocks libev 一键安装](https://github.com/iMeiji/shadowsocks_install/wiki/shadowsocks-libev-%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85)，其他详细信息如 Shadowsocks 优化等，参考 [https://github.com/iMeiji/shadowsocks_install/wiki](https://github.com/iMeiji/shadowsocks_install/wiki)

## Shadowsocks 客户端下载

* [For Windows](https://github.com/shadowsocks/shadowsocks-windows/releases)
* [For Mac](https://github.com/shadowsocks/ShadowsocksX-NG)
* [For Linux](https://github.com/shadowsocks/shadowsocks-qt5/releases)
* [For Android](https://github.com/shadowsocks/shadowsocks-android/releases)
* 对于 IOS，可尝试在 App Store 搜索 Wingy，若无结果，请使用美区账号登录 App Store 再进行操作，可以参考 [https://doub.io/ss-jc25/](https://doub.io/ss-jc25/)，或者参考下文中的 VPN 搭建来搭建一个 VPN 供苹果设备使用。

## 其他代理方式

* VPN

[VPN 服务端搭建](https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/README-zh.md)

[VPN 客户端配置](https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients-zh.md)

* V2Ray

[https://www.v2ray.com/](https://www.v2ray.com/)

* Outline

[https://getoutline.org/en/home](https://getoutline.org/en/home)

## 参考

1. [https://shadowsocks.org](https://shadowsocks.org)
2. [https://github.com/shadowsocks](https://github.com/shadowsocks)
3. [https://github.com/iMeiji/shadowsocks_install/wiki/shadowsocks-optimize](https://github.com/iMeiji/shadowsocks_install/wiki/shadowsocks-optimize)
4. [https://github.com/iMeiji/shadowsocks_install/wiki/%E5%BC%80%E5%90%AFTCP-BBR%E6%8B%A5%E5%A1%9E%E6%8E%A7%E5%88%B6%E7%AE%97%E6%B3%95](https://github.com/iMeiji/shadowsocks_install/wiki/%E5%BC%80%E5%90%AFTCP-BBR%E6%8B%A5%E5%A1%9E%E6%8E%A7%E5%88%B6%E7%AE%97%E6%B3%95)
5. [https://www.zhujiceping.com/](https://www.zhujiceping.com/)
6. [https://doub.io/](https://doub.io/)