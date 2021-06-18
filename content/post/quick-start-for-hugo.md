---
title: "Hugo 快速入门"
date: 2018-08-13T22:05:40+08:00
draft: false
tags: ["Hugo"]
---

## Hugo 介绍

[Hugo](https://gohugo.io) 是一个使用 [Golang](https://golang.org) 编写的静态站点生成器, 其他类似的工具还有 [Hexo](https://hexo.io), [Jekyll](https://jekyllrb.com) 等等.

Hugo 具有简单, 易用, 高效, 易扩展, 快速部署等特点, 目前在 GitHub 上具有 52.3k 个 star, 是目前较为流行的几大静态站点生成器之一, 目前, 绝大多数 Hugo 使用者都将 Hugo 用于搭建个人博客, 当然, Hugo 也可用于搭建技术网站, 组织生成文档等等.

<!--more-->

## 下载安装 Hugo

要安装 Hugo 可以参考 Hugo 官方的安装文档 [Install Hugo](https://gohugo.io/getting-started/installing/), 也可参照下述步骤进行安装.

### 获取最新版本的 Hugo

为获取最新版本的 Hugo, 我们可以访问 [https://github.com/gohugoio/hugo/releases](https://github.com/gohugoio/hugo/releases) 然后根据自己的操作系统版本进行下载, 截止至本文编写时 Hugo 最新版本为 `0.83.1`.

> 因某些主题的特殊功能需要用到 extended 版本支持, 如有需要请使用 hugo extended 版本.

### For Windows

下载 ``hugo_0.83.1_Windows-64bit.zip`` 并解压到特定的软件目录如 ``D:\Programs\Hugo``, 其中的 ``hugo.exe`` 即为 Hugo 的可执行文件, 为了方便在命令行控制台使用, 我们需要将 Hugo 配置到环境变量.

依次打开资源管理器（我的电脑）-- 右键 “计算机” -- 选择“属性” -- 高级系统设置 -- 环境变量 -- 选择 Path 变量 -- 编辑 -- 新建 -- 填入 ``D:\Programs\Hugo`` -- 保存并退出.

配置完成之后可以打开命令行控制台输入 ``hugo version`` 查看是否配置成功, 若命令输出类似如下则表示成功配置了环境变量.

``` shell
hugo v0.83.1-5AFE0A57 windows/amd64 BuildDate=2021-05-02T14:38:05Z VendorInfo=gohugoio
```

### For Mac

``` shell
wget https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_0.83.1_macOS-64bit.tar.gz
tar -xf hugo_0.83.1_macOS-64bit.tar.gz
sudo mv hugo /usr/local/bin/
hugo version
```

### For Linux

``` shell
wget https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_0.83.1_Linux-64bit.tar.gz
tar -xf hugo_0.83.1_Linux-64bit.tar.gz
sudo mv hugo /usr/local/bin/
hugo version
```

## Hugo 简单使用

### 创建一个新站点

执行如下命令创建一个新站点.

``` shell
hugo new site blog
cd blog
git init
git add .
git commit -m "init with 'hugo new site [folder]' command."
```

### 安装主题

Hugo 默认是不带主题的, 用户在新建站点的时候需要手动安装一个主题才能使用, 主题可以在这里 [https://themes.gohugo.io/](https://themes.gohugo.io/) 找到, 每个主题的安装使用方式会有些不太一样, 具体根据主题作者提供的教程进行安装使用, 下面的命令以 [even](https://github.com/olOwOlo/hugo-theme-even) 主题为例为 Hugo 安装主题.

``` shell
git submodule add [theme remote url] themes/even
cp themes/even/exampleSite/config.toml .
```

### Hugo 常用命令及使用技巧

1. 运行 Hugo

执行如下命令运行 Hugo, Hugo 默认运行在 1313 端口, 可到浏览器访问 [http://localhost:1313/](http://localhost:1313/)

``` shell
hugo server -D
```

2. 创建新文章

``` shell
hugo new post/hello-world.md
```

注意, 部分主题使用的是 ``posts`` (即应该执行 ``hugo new posts/hello-world.md``), 请根据自己所采用的主题进行操作.

执行如上的命令之后将会在站点根目录下的 ``content/post`` 目录下发现刚刚新建的文件 ``hello-world.md``, 使用自己喜欢的 `Markdown` 编辑器添加内容即可.

3. 生成静态页面

若想需要生成静态页面用于托管到服务器, 可在站点根目录下执行如下命令, 其中的 ``target url`` 即自己实际使用的域名, 生成的静态页面文件将位于 ``public`` 目录下

``` shell
hugo --baseURL [target url]
```

4. 为文章添加标签/分类

在每篇文章的开头对应部分加入如下内容

``` markdown
---
title: "..."
...
tags: ["Hugo", "Blog"]
categories: ["Demo"]
...
---
```

4. Hugo 图片存储目录

可将文章中引用到的图片文件放到 ``static`` 的 ``images`` 目录下, 这样在文章中引用图片的书写格式为

``` markdown
![xxx](/images/xxx.png)
```

5. 在一篇文章中链接到另外一篇文章

``` markdown
[another-doc-title]({{\< ref "another-doc" \>}})  # remove '\'
```

## 参考

[Hugo](https://gohugo.io/)

[Hugo Github](https://github.com/gohugoio/hugo)

[Hugo Doc](https://gohugo.io/documentation/)

[Even](https://github.com/olOwOlo/hugo-theme-even)

[Favicon generator](https://realfavicongenerator.net)
