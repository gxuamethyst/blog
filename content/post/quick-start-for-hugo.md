---
title: "Quick Start for Hugo"
date: 2018-08-13T22:05:40+08:00
draft: false
tags: ["Hugo"]
---

### Get latest version of hugo

**Download link:** [https://github.com/gohugoio/hugo/releases](https://github.com/gohugoio/hugo/releases)

### Create new site

``` shell
hugo new site blog
cd blog
git init
git submodule add [theme remote url] themes/even
cp themes/even/exampleSite/config.toml .
hugo server -D
```

**Hugo themes:** [https://themes.gohugo.io/](https://themes.gohugo.io/)

### Create new post

``` shell
hugo new post/hello-world.md
```

### Add tags & categories

``` markdown
tags: ["Hugo", "Blog"]
categories: ["Demo"]
```

### Generate static html

``` shell
hugo --baseURL [target url]
```

### Refrences

[Hugo](https://gohugo.io/)

[Hugo Github](https://github.com/gohugoio/hugo)

[even](https://github.com/olOwOlo/hugo-theme-even)
