---
title: "如何为 GitHub 的项目添加开源许可证（license）"
date: 2018-08-19T14:06:59+08:00
draft: false
tags: ["GitHub"]
---

### 关于开源许可证

关于开源许可证的说明/介绍和使用等相关信息，可以参考以下链接中的两篇博文，或者自行 Google。

* [如何选择开源许可证？](http://www.ruanyifeng.com/blog/2011/05/how_to_choose_free_software_licenses.html)

* [一张图看懂开源许可协议，开源许可证GPL、BSD、MIT、Mozilla、Apache和LGPL的区别](https://blog.csdn.net/testcs_dn/article/details/38496107)

对于已经添加了许可证的 GitHub 项目，该项目的许可信息将会显示在该项目的主页面中。

<!--more-->

![about-license](/images/about-license.png)

### 为新建的项目/仓库添加开源许可证

对于新建的代码仓库，GitHub 在你新建仓库的页面上便会出现相应的 “Add a license” 选项，根据自己的需要添加即可。

![new-repository-add-license](/images/new-repository-add-license.png)

### 为已存在的项目/仓库添加开源许可证

对于已创建的代码仓库，在 GitHub 仓库主页面中点击 “Create new file”。

![create-new-file](/images/create-new-file.png)

在跳转到的页面内的文件输入框中填入 “LICENSE”，在文件输入框的右侧将会出现 “Choose a license template” 按钮，点击该按钮。

![input-license](/images/input-license.png)

根据自己项目的需要，选择对应的许可证，并添加相应的信息，点击 “Review and submit” 按钮。

![choose-license](/images/choose-license.png)

然后填写提交信息并提交到主分支（或其他自己需要提交到的分支）上即可。

![add-license-commit](/images/add-license-commit.png)

### 参考

[https://opensource.org/licenses](https://opensource.org/licenses)

[https://help.github.com/articles/adding-a-license-to-a-repository/](https://help.github.com/articles/adding-a-license-to-a-repository/)

[https://choosealicense.com/](https://choosealicense.com/)
