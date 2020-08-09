---
title: "知轩藏书 - 小说爬取"
date: 2019-08-11T16:05:18+08:00
draft: true
tags: ["Novel", "Crawler"]
---

# 初衷

[知轩藏书](http://zxcs.me) 算是网文界一个比较有名的网站了吧, 专门提供各种网络小说的精校/校对版本供网友下载, 但是目前这个网站上的小说越来越多, 如何从中找出自己想看/喜欢的呢?

打开里面的网页会注意到, 每本书有相应的网友作出的评价, 分仙草/粮草/干草/枯草/毒草不等, 看完小说内容简介, 可以参考一下这个评价, 决定是否下载来看看.

但是还是那句活, 这个网站上的小说太多了, 书荒的同学找书要找好久, 因此技术宅想试试能不能使用爬虫来干这个活.

# 尝试是否可行/思路

要想爬取内容, 我想得先有一系列的网页/小说列表供爬取吧, 然后打开 [知轩藏书](http://zxcs.me) 可以看到网站将小说分为了 精校玄幻, 精校仙侠等分类, 其中点进 [精校玄幻](http://www.zxcs.me/sort/39) 在这里有玄幻类的小说列表, 分页形式, 使用 Chrome 浏览器, 显示网页源代码, 查看 [精校玄幻](http://www.zxcs.me/sort/39/page/1) 页的源代码, 查一下, 就会发现网页内的小说链接是在下面这个节点内

小说列表页

``` HTML
http://www.zxcs.me/sort/39/page/1
```

``` HTML
<dl id="plist">
</dl>
...
<dl id="plist">
<dt>
    <a href="http://www.zxcs.me/post/11626">《儒道至圣》（校对版全本）作者：永恒之火</a>
</dt>
<dd class="des">


    【TXT大小】：15.7 MB
    【内容简介】：　　这是一个读书人掌握天地之力的世界。
    　　才气在身，诗可杀敌，词能灭军，文章安天下。
    　　秀才提笔，纸上谈兵；举人杀敌，出口成章；进士一怒，唇枪舌剑。
    　　圣人驾临，口诛笔伐，可诛人，可判天子无道，以一敌国。
    　　此时，圣院把持文位，国君掌官位，十国相争，蛮族虎视，群妖作乱。
    　...
</dd>
<dd>
    分类：
    <a href="http://www.zxcs.me/sort/39">精校玄幻</a>
    &nbsp; <a href="http://www.zxcs.me/tag/%E4%B8%9C%E6%96%B9%E7%8E%84%E5%B9%BB">东方玄幻</a> &nbsp;&nbsp;&nbsp;发布者：<a
        href="http://www.zxcs.me/author/1711">Lerida</a>&nbsp;&nbsp;&nbsp;时间：大约 2 天前
    <div align="right"><a href="http://www.zxcs.me/post/11626" class="vw">查看全文</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <br/>

</dd>
</dl>
...
<dl id="plist">
</dl>
```

分类列表总页数

``` HTML
<div id="pagenavi">
    <span>1</span>
    <a href="http://www.zxcs.me/sort/39/page/2">2</a>
    <a href="http://www.zxcs.me/sort/39/page/3">3</a>
    <a href="http://www.zxcs.me/sort/39/page/4">4</a>
    <a href="http://www.zxcs.me/sort/39/page/5">5</a>
    <a href="http://www.zxcs.me/sort/39/page/6">6</a>
    <em>...</em>
    <a href="http://www.zxcs.me/sort/39/page/72" title="尾页">&raquo;</a>
</div>
```

各本小说详情页都在 `http://www.zxcs.me/post/11626` 这种网页链接里, 发现知轩藏书就是通过这个链接 post 后面的数字来标识各本书, 

其中, 下面这个链接对应书籍详情页

``` URL
http://www.zxcs.me/post/11626
```

下面这个链接对应书籍下载页

``` URL
http://www.zxcs.me/download.php?id=11626
```

下面这个链接对应书籍评价信息(仙草/粮草/干草/枯草/毒草), 其中 m 参数为一个随机数

``` URL
http://www.zxcs.me/content/plugins/cgz_xinqing/cgz_xinqing_action.php?action=show&m=0.8226499436430394&id=11626
```

