---
title: "Hugo 自动部署"
date: 2018-08-13T22:15:12+08:00
draft: false
tags: ["Hugo", "Caddy"]
---

若是我们将 Hugo 部署/托管到自己的云服务器中的话，每次更新一篇文章或者对自己的博客修改一点点内容之后，我们需要提交代码到 Github，然后登录云服务器，在服务器中从 Github 同步代码，之后手动执行 ``hugo --baseURL URL`` 命令来生成静态页面。

这样的一系列操作显得比较复杂、繁琐，而且逼格也不够高，为了简化这些操作，可以参照下面的操作来实现 Hugo 的自动部署。

<!--more-->

### 配置域名解析

首先，你需要拥有一个域名，可以到阿里云、腾讯云等云服务提供商进行购买，然后将域名解析到你需要操作的服务器 IP，关于这方面的知识可以直接在阿里云/腾讯云的域名购买页面中查看到，或自行 Google。

### Add SSH key to GitHub

由于后续操作需要下载我们保存在 Github 上的 Hugo 博客源码，所以我们需要将服务器的 SSH key 添加到自己的 Github 账号中，若是托管到 BitBucket 或者 Gitee 等其他地方的，同样需要添加 SSH key。

执行如下命令显示 SSH 公玥并复制到 Github -- Settings -- SSH and GPS keys -- SSH keys -- New SSH key 中添加即可，若是提示文件不存在，先执行 ``ssh-keygen`` 命令生成一个 SSH key 即可（若提示输入内容，可不管，一路回车使用默认配置）

``` shell
cat ~/.ssh/id_rsa.pub
```

![add-ssh-key](/images/add-ssh-key.png)

### Add webhook

在我们的 Github 博客项目当中，选择 Settings -> Webhooks -> Add webhook，其中的 ``https://gxuamethyst.ink`` 即为自己博客的域名，这样我们每次提交新的代码/内容之后，都会触发到 ``https://gxuamethyst.ink/webhook``，若想了解更多关于 Webhook 的知识请自行 Google。

![add-webhook](/images/add-webhook.png)

![add-webhook-detail](/images/add-webhook-detail.png)

### 服务器端安装 Hugo

参考本人前一篇博文 [Hugo 快速入门]({{< ref "quick-start-for-hugo.md/#for-linux" >}})

### 下载安装 Caddy

> Caddy服务器（或称Caddy Web）是一个开源的，使用 Golang 编写，支持 HTTP/2 的 Web 服务端。
Caddy 一个显著的特性是默认启用 HTTPS。它是第一个无需额外配置即可提供 HTTPS 特性的 Web 服务器。
[Caddy - 维基百科](https://zh.wikipedia.org/wiki/Caddy)

要下载 Caddy 可以到其官方网站 [https://caddyserver.com/download](https://caddyserver.com/download) 上进行下载，下载的时候需要选择根据自己的操作系统类别，所需要的插件进行下载，对于插件，我们用到了 http.git, http.hugo, http.minify，以 Ubuntu 16.04 为例，选择完成之后可执行如下命令进行下载安装

``` shell
curl https://getcaddy.com | bash -s personal http.git,http.hugo,http.minify
```

### 配置 Caddyfile

关于 Caddy 的更多使用介绍这里不多说，可以参考 Caddy 的官方文档或 Google 查找相关内容，下载完成之后我们需要新建一个 Caddy 配置文件供我们的博客网站运行使用。

执行如下命令新建 ``Caddyfile`` 文件

``` shell
sudo mkdir /etc/caddy
sudo vim /etc/caddy/Caddyfile
```

然后根据自己的实际情况，添加如下内容并保存（其中的 ``hugo@webhook`` 为添加 Webhook 时填写的 secret key）

```
http://gxuamethyst.ink {
    redir https://gxuamethyst.ink
}
https://gxuamethyst.ink {
    tls gxuamethyst@gmail.com
    gzip
    minify
    root /home/ubuntu/blog/public
    git {
        repo git@github.com:gxuamethyst/blog.git
        key /home/ubuntu/.ssh/id_rsa
        path /home/ubuntu/blog
        then hugo --baseURL=https://gxuamethyst.ink --destination=/home/ubuntu/blog/public
        hook /webhook hugo@webhook
        hook_type github
        clone_args --recursive
        pull_args --recurse-submodules
    }
    hugo
}
```

### 运行 Caddy

执行如下命令运行 Caddy，若无误，此时使用浏览器即可进行访问，否则请根据错误提示到 Google 查找相关内容并解决。

``` shell
sudo caddy -conf /etc/caddy/Caddyfile
```

注意，执行成功之后可能会提示如下的警告

``` shell
WARNING: File descriptor limit 1024 is too low for production servers. At least 8192 is recommended. Fix with "ulimit -n 8192".
```

为了解决这个问题，我们可以执行如下操作修改文件句柄限制

``` shell
sudo vim /etc/security/limits.conf
```

在 ``/etc/security/limits.conf`` 文件中追加如下内容并保存

``` shell
* soft nofile 65535
* hard nofile 65535
* soft nproc 65535
* hard nproc 65535
```

### Caddy 后台运行/开机自启

在前面的内容中可发现执行 ``sudo caddy -conf /ect/caddy/Caddyfile`` 之后无法后台运行，为了将 Caddy 放入后台运行且开机自动启动，我们可以将 Caddy 加入到 systemd

首先，新建 ``/etc/systemd/system/caddy.service`` 文件

``` shell
sudo vim /etc/systemd/system/caddy.service
```

添加如下内容并保存

```
[Unit]
Description=Caddy Server
After=syslog.target
After=network.target

[Service]
User=root
Group=root
LimitNOFILE=64000
ExecStart=/usr/local/bin/caddy -conf /etc/caddy/Caddyfile
Restart=always

[Install]
WantedBy=multi-user.target
```

然后执行如下命令使其生效

``` shell
sudo systemctl daemon-reload
sudo systemctl start caddy.service
sudo systemctl enable caddy.service
```

查看 Caddy 是否已在正常运行

``` shell
sudo systemctl status caddy.service
```

### 总结

执行完如上的一系列操作配置完成之后，以后每次修改完博客内容并提交到 Github，将会触发 Caddy 自动更新 Github 代码，并使用 Hugo 自动生成静态页面并更新 Web 服务器内容，再也不需要手动进行操作了。

### 参考

[https://gohugo.io/getting-started/installing/](https://gohugo.io/getting-started/installing/)

[https://github.com/gohugoio/hugo/releases](https://github.com/gohugoio/hugo/releases)

[https://caddyserver.com/download](https://caddyserver.com/download)

[https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

[https://github.com/Unknwon/wuwen.org/issues/11](https://github.com/Unknwon/wuwen.org/issues/11)

[https://nickfan.github.io/2018/01/05/caddy-hugo-acme/](https://nickfan.github.io/2018/01/05/caddy-hugo-acme/)

[https://sqh.me/tech/host-hugo-blog-using-caddy/](https://sqh.me/tech/host-hugo-blog-using-caddy/)

