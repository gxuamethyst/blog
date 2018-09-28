---
title: "局域网内使用 Android 手机控制电脑音乐播放"
date: 2018-09-18T17:37:22+08:00
draft: false
---

下班后累了就只想着开电脑躺床上听歌，这时候问题就来了，有时候想要切歌又不想动不想回到电脑桌前切歌怎么办，为此产生了如下的使用 Android 手机切换电脑音乐播放的解决方案，使用手机放歌的小伙伴们请忽略。

<!--more-->

实现的原理很简单，我们的音乐播放软件可以设置一些全局快捷键，然后电脑端开启一个 Web 服务器，接收来自局域网的 Android 手机的 HTTP 请求，进而触发执行 Windows 快捷键执行切换音乐播放等操作。

1. 首先，电脑、手机应该处于同一个局域网下，一般个人/家庭用的都是路由器，已经是处于同一个局域网下了，这个条件大家一般都满足。

2. 接着，给音乐播放软件设置全局快捷键/热键，如本人设置的快捷键是

 * 上一曲: Ctrl + ←
 * 下一曲: Ctrl + →
 * 播放/暂停: Ctrl + ↓

3. 为了实现代码内执行快捷键，我们使用 VBS 脚本来实现，如执行 ``Ctrl + ←`` 快捷键的脚本为

``` vbs
set WshShell = CreateObject("Wscript.Shell") 
WshShell.SendKeys "^{LEFT}"
```

将如上的两行代码复制到文本编辑器中并另存为 ``last.vbs`` 文件，这时候可以尝试双击此脚本文件测试切换音乐是否可用。

而为了实现音量调节，我们还可以使用如下的代码

``` vbs
set WshShell = CreateObject("Wscript.Shell") 
WshShell.SendKeys Chr(&H88AE)
```

更多关于 VBS 脚本内 SendKeys 对应键盘的代码参考 [VBScript - SendKeys Method](https://social.technet.microsoft.com/wiki/contents/articles/5169.vbscript-sendkeys-method.aspx)

其他的如下一曲/播放/暂停的代码可以参考 [GitHub-MusicController-VBS](https://github.com/gxuamethyst/MusicController/tree/master/server/music_controller)

4. 之后就需要搭建 Web 服务器了，PHP 中有一个 ``exec(...)`` 方法用来执行一个文件，当然，Nodejs 和 Golang 中也有对应的类似的方法，由于本人对 PHP 比较熟悉，因此就使用 [XAMPP](https://www.apachefriends.org/zh_cn/download.html) 这个软件一键安装 PHP Web 服务器了，下载完成之后直接安装即可，安装完成之后打开显示如下

![xampp](/images/xampp.png)

默认安装位置为 ``C:\xampp``，网页文件目录为 ``C:\xampp\htdocs``，本人所使用的 PHP 代码为

``` php
<?php
/* persional music controller */

if (isset($_POST['action'])) {
	
    $action = $_POST['action'];

    if ($action === "start") {
        exec("start.vbs");
        exec("play.vbs");
    } else if ($action === "last") {
        exec("last.vbs");
    } else if ($action === "next") {
        exec("next.vbs");
    } else if ($action === "play") {
        exec("play.vbs");
    } else if ($action === "volume_up") {
        exec("volume_up.vbs");
    } else if ($action === "volume_down") {
        exec("volume_down.vbs");
    }
}

echo "{}";

```

在 ``C:\xampp\htdocs`` 目录下新建文件夹 ``music_controller`` 并新建文件 ``index.php`` 复制如上代码并保存，并将之前编辑好的脚本文件放入此文件夹下，如下图所示

![web-dir](/images/web_dir.png)

5. 之后其实就可以使用 Postman 来测试是否可用了，如下所示，其中的 ``192.168.0.2`` 即为电脑的局域网 IP

![postman-test](/images/postman-test.png)

6. 最后，简单地写一个 Android App，这个 App 主界面只有几个按钮，当点击对应按钮时发送对应的 HTTP 请求即可

![music-controller](/images/music-controller-app.png)

以上 PHP 代码、VBS 脚本文件及 Android App 源码见 [GitHub-MusicController](https://github.com/gxuamethyst/MusicController)