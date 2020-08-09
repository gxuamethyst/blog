---
title: "Hackintosh_note"
date: 2020-07-01T21:29:10+08:00
draft: true
---

# 黑苹果(Hackintosh)从入门到放弃

## 入门

* 苹果电脑(iMac, Mac Pro, MacBook) -- 需要了解, 知道是啥

* 苹果操作系统 macOS -- 需要了解, 知道是啥

相对应的, 得知道一下 Windows, Linux

* 什么是黑苹果? -- 需要了解, 知道是啥

简单地说, 就是在非苹果公司的电脑/硬件, 比如自己组装的台式机, 非苹果品牌的笔记本上, 安装苹果的操作系统 macOS, 称之为黑苹果(Hackintosh), 相对应的, 正经的苹果电脑, macOS, 称之为白苹果(Macintosh).

https://zh.wikipedia.org/wiki/Hackintosh -- 可能比较难理解, 生涩

https://baike.baidu.com/item/%E9%BB%91%E8%8B%B9%E6%9E%9C/5220943 -- 百度的, 较通俗

可以自己 Google, Baidu 搜索 黑苹果/Hackintosh, 得到自己的答案, 有个大致的了解.

* 这是你想要的东西吗? 为什么要去折腾这鬼东西呢? -- 需要确认

* 折腾这玩意儿, 需要什么东西?

  - 首先, 当然是一台电脑啦, 不然你装黑苹果装哪儿去?
   > 而且, 最好是一台性能不错的电脑, 不然玩起来可能没啥意思
  - 装系统, 当然需要一个 U 盘啦, >= 16G 的 U 盘.
  - 另外就是一些镜像, 软件包啥的了, 后面用到再说, 有网就能下
  - 最好能访问 Google, 查一些东西方便, 准确
  - 最好,,, 还有一台苹果电脑, 因为后续有些操作啥的需要在 macOS 下操作, 实在没有,,, 装个 macOS 虚拟机吧.
  - 一定的英文水平.

* 可以去哪里找到相关的一些资料/知识/文档/教程?

主要集中在下面这些个网站, 地方, 可以先去 Google 搜索一下, 查找一些黑苹果相关的文章, 教程, 折腾流程啥的, 可以不用细看, 了解大致的需要做的一些工作即可.

> Google
> PCBeta
> tonymacx86
> GitHub
> ... etc.

* 需要注意的地方?

  - 如果装双系统, 记得备份自己的数据, 容易丢, 这个备份, 是指备份到折腾的那台电脑外部的 U 盘, 硬盘, 网盘等等.
  - 如果要买显示器, 要么买 1080P 的, 要么买 4K 的, 甚至 5K 的, 不要买 2K 的, 不要买 2K 的, 不要买 2K 的.

## 放弃

### 预备

* 想要买配件自己装一台? 参考 tonymacx86 的购买建议.(部分主板/CPU/显卡对于黑苹果容易装一些)

https://www.tonymacx86.com/buyersguide/building-a-customac-hackintosh-the-ultimate-buyers-guide/

* 安装 macOS 虚拟机

因为后续有些操作需要在 macOS 下执行的, 而且, 不信任网上的, 别人打包的各种镜像的时候, 可以用来获取 macOS 官方镜像, 自己打包/制作启动盘, 后续一些操作如果需要在 macOS 下操作的话, 也可以在这个虚拟机里操作.

参考

https://techsviewer.com/how-to-install-macos-10-15-catalina-on-vmware-on-windows-pc/

https://www.geekrar.com/install-macos-mojave-on-vmware/

https://post.smzdm.com/p/ax08lz74/

* 制作启动盘 -- 需要在 macOS 下操作

从 apple store 中搜索, 下载 macOS 到本地,

苹果官方就提供了一个教程教如何制作启动盘,

https://support.apple.com/zh-cn/HT201372

https://www.jianshu.com/p/fd6d57a67912

> 下载镜像;
> 插入 U 盘, 打开磁盘工具, 选中 U 盘, 抹掉, 选择 "macOS 扩展(日志式)", "GUID 分区图";
> 打开终端, 输入苹果官方教程里的命令制作启动盘

``` shell
# 请根据实际修改对应的 U 盘名等参数
➜  ~ sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/USB
Password:
Ready to start.
To continue we need to erase the volume at /Volumes/USB.
If you wish to continue type (Y) then press return: Y
Erasing Disk: 0%... 10%... 20%... 30%...100%...
Copying installer files to disk...
Copy complete.
Making disk bootable...
Copying boot files...
Copy complete.
Done.
➜  ~
```

### EFI 配置

#### Clover 相关配置相关

如果有现成的 Clover EFI, 先下载 Clover Configurator, 打开, 选择挂载分区, EFI 分区, 选 U 盘, 在 Finder 中打开, 将 EFI 文件夹放入即可, 接下来到下一步.

否则, 就得自己配置自己的 Clover EFI 了.

首先, 了解一下 Clover. -- 找找相关的教程

关于 Kexts -- 了解, 知道是啥, 都有哪些

#### 收集 Kexts

首先, VirtualSMC.kext 必不可少, 那就先只要这一个, 然后不断装机, 开机, 检测哪个功能不可用, 再加上对应的 .kext, 一个个地加进来, 没用的不要;

.efi 文件也是, 首先, 必须的, 知道啥用的, 就加上, 否则不要;

https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/gathering-kexts

#### 安装 Clover 到 U 盘

Clover.app_v1.23.pkg -- 没啥用, https://heipg.cn/apps/clover-app-1-15beta.html

执行 "Clover_r5119.pkg" 安装, 操作过程如下:

1. 双击之后, 显示 "介绍页", 点 "继续"

2. "请先阅读" 页, 点 "继续"

> Clover 是基于 Clover, rEFIt, XNU, VirtualBox 等不同项目的开放源码。 主要基于 EDK2 最新修正版。 
> https://github.com/CloverHackyColor/CloverBootloader
> 主要功能：
> 	•	支持 引导 10.xx macOS, Windows EFI 及 Linux EFI
> 	•	它是 EFI 引导器, 给操作系统提供 RuntimeServices (传统引导器无法提供)
> 	•	默认 自动侦测大部份的硬件并设置所有属性 但是用户也可以在 config.plist 中修改
> 	•	使用 Clover, 你可以从 启动磁盘 面板重启进入其他操作系统
> 	•	写入 与操作系统相同的 UUID 到 config.plist
> 	•	修正 SMBIOS 至 standard 2.6 版本
> 	•	修正 ACPI 至 标准 4.0 版本。
> 	•	支持从 启动分区 或 EFI文件夹 加载 DSDT
> 	•	DSDT patching on the fly by fixes and by patterns
> 	•	支持 可定制的 RestartFix 和 睡眠/唤醒 修复 并 支持 PCIRootUID 值
> 	•	支持大部分 ATI, NVidia 及 Intel 显卡 的 属性注入, 并支持定制化参数设置。
> 	•	支持 USB 及 USB 3.0 的修复 (LegacyOff, Ownership, Builtin, clock-id)
> 	•	支持 HDA 及 以太网卡 属性内建功能
> 	•	支持 开启 CPU turbo 及 自动生成 P-State 及 C-State 的功能
> 	•	支持 ACPI 表单加载 (SSDT-xx, APIC, BOOT, SLIC, SLIT, SRAT, UEFI...)
> 	•	支持 加载额外的 内核扩展
> 	•	支持 必要情况下对 内核 及 内核扩展 的修正
> 	•	支持 设置 NVRAM 变量来实现不同的需求
> 	•	可按 F10 储存 图形界面 GUI 的截图，可设定默认启动区及定制化 GUI 图形界面
> 	•	可按 F2 储存操作系统的日志 boot.log 及 GUI 的日志 preboot.log

3. 第三项 "目的宗卷" 将会在第四项 "安装类型" 中选择,

点 "更改安装位置...", 选 U 盘, 点 "继续";

4. 点左边的 "自定" 修改自定义配置,

勾选 "仅安装 UEFI 启动版本",
勾选 "安装 Clover 到 ESP 系统分区";
不勾选 "停用驱动";

"UEFI 驱动, 64 位版本"下拉菜单中,
  "推荐驱动"里的 AudioDxe, DataHubDxe, FsInject, SMCHelper 勾选;
  "人机接口设备", 不勾选;
  "文件系统驱动", 勾选 ApfsDriverLoader, VBoxHfs;
  "内存修正驱动", 勾选 AptioMemoryFix;
  "文件保险箱 UEFI 驱动, 64 位版本", 不勾选;
  "更多驱动", 不勾选;

不勾选 "安装 RC 脚本到目标宗卷";
不勾选 "安装全部 RC 脚本到全部可启动的 OSX 宗卷";
不勾选 "选择安装 RC 脚本";
不勾选 "开机主题";
不勾选 "安装 Clover 系统偏好设置面板";

点击 "安装", 输入密码, 直到安装完成.

* 放入 Kexts

安装完成之后会自动挂载 U 盘 EFI 分区, 放入 VirtualSMC, Lilu, IntelMausi, AppleALC, WhateverGreen

https://bitbucket.org/RehabMan/os-x-usb-inject-all/src/master/

* Clover 主题

/Users/gxuamethyst/Downloads/hackintosh_tools/CloverThemes-master/MaterialDark
/Users/gxuamethyst/Downloads/hackintosh_tools/CloverThemes-master/Sphere
/Users/gxuamethyst/Downloads/hackintosh_tools/CloverThemes-master/Emerald

* 精简 Clover EFI

https://www.tonymacx86.com/threads/macos-10-14-6-update.281014/page-9#post-1986904

> Clover Rev 5000 and later has a new folder structure for the EFI drivers ...
> /EFI/Clover/drivers/BIOS ...... (replaces EFI/Clover/drivers64)
> /EFI/Clover/drivers/UEFI ....... (replaces EFI/Clover/drivers64UEFI)

需要清楚，每一个文件，包括 efi，kext，用来干啥的，为什么需要，是否必要，为什么我的配置里需要，

每一个 config.plist 配置项，什么意思，用来干啥的，为什么这么写，有什么依据，为什么需要，是否必要，为什么我的配置里需要，

### 尝试安装

3. 尝试装机

配置 BIOS

4. 排错, 验证各个功能是否正常

CPU 识别, 变频 // done
内存识别 // done
显卡识别, 硬解(用iina更简单，cmd+I就可以调出信息显示是否硬件解压) // done, 硬解好像就是不行的.
声卡, 插入耳机啥的可自动切换 // done
USB 口是否正常, 速度是否正常 // done
睡眠 // done
Facetime, iMessage // tobe verify
有线网卡是否正常 // done
键盘, 鼠标是否正常, 快捷键是否可用  // done
风扇, 温度正常? 
双系统引导, 正常?

---

### 排错

#### BIOS 设置 // done

对比 教程里的, 各个 github 里的, tonymacx86 上的安装教程, 看涉及哪些 BIOS 设置项,
目前, 已基本了解, 确认了, 该操作哪些 BIOS 设置项, 已更新到 README.md

#### Clover preboot.log 排错 // done

在 Clover 界面按 F2 抓取 preboot.log 到 EFI 分区 `EFI/CLOVER/misc/preboot.log`

分析 preboot.log 是否有异常, 逐个删除, 修复.

#### Clover boot log 排错 // blocked

启动参数 `-v debug=0x100 keepsyms=1`, config.plist 里打开 debug 开关, 获得 debug.log // 并没有什么用

efi shell 里面执行? bdmesg // 得到的也是 preboot.log 的内容, 无用

用手机录屏？一帧一帧地看？ // 不现实

https://sourceforge.net/p/cloverefiboot/wiki/Home/
https://github.com/headkaze/Hackintool

#### 系统启动 log 排错 // pending

``` shell
log show --last boot | grep -Ei "ACPI"
# https://www.tonymacx86.com/threads/solved-wheres-verbose-boot-log-located.231434/
log show --predicate "processID == 0" --debug
log show --predicate "processID == 0" --start $(date "+%Y-%m-%d") --debug
```

#### Clover 每一项配置, 有啥用, 是否必须, 一一检查 // pending

#### ACPI/DTST/STDT 修改, 排错 // pending

#### OpenCore 迁移 // pending

* opencore 相关

https://github.com/acidanthera/OpenCorePkg
https://khronokernel-2.gitbook.io/opencore-vanilla-desktop-guide/
https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html
https://blog.xjn819.com/?p=543
https://blog.daliansky.net/OpenCore-BootLoader.html
https://ocbook.tlhub.cn/
https://shuiyunxc.gitee.io/
https://dortania.github.io/OpenCore-Install-Guide/

## 参考

* https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/

* https://support.apple.com/zh-cn/HT201372

* https://www.tonymacx86.com/buyersguide/building-a-customac-hackintosh-the-ultimate-buyers-guide/

* https://oc.skk.moe/

* https://blog.csdn.net/LeoForBest/article/details/103247824
