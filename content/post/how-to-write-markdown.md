---
title: "Markdown 语法练习"
date: 2018-08-15T21:06:33+08:00
draft: false
tags: ["Markdown"]
---

# Markdown 介绍

[Markdown](https://zh.wikipedia.org/wiki/Markdown) 是一种轻量级标记语言, 创始人为约翰·格鲁伯(John Gruber). 它允许人们"使用易读易写的纯文本格式编写文档, 然后转换成有效的 `XHTML`(或者 `HTML`)文档".

<!--more-->

# Markdown 语法

## 插入图片

语法:

``` markdown
![Alt Text](url)
```

示例:

``` markdown
![Foo](https://en.wikipedia.org/static/images/project-logos/enwiki.png)
```

示例结果:

![Foo](https://en.wikipedia.org/static/images/project-logos/enwiki.png)

## 换行

在 Markdown 文本中输入的换行会从最终生成的结果中删除, 浏览器会根据可用空间自动换行. 如果想强制换行, 可以在行尾插入至少两个空格.

## 格式化文本

示例:

``` markdown
*斜体字*

_这也是斜体字_

**强调**

这也是__强调__

同时*使用**强调**和斜体*

~~删除线~~

插入行内代码 `public class`
```

示例结果:

*斜体字*

_这也是斜体字_

**强调**

这也是__强调__

同时*使用**强调**和斜体*

~~删除线~~

插入行内代码 ``public class``

## 标题

可以在标题内容前输入特定数量的井号('#')来实现对应级别的HTML样式的标题(HTML提供六级标题). 使用 Typora 导出成 PDF 文件时将会根据标题生成文章目录.

示例:

``` markdown
# 一级标题
## 二级标题
...
###### 六级标题
```

## 断行

若是需要在 Markdown 文档中的某个地方强制断行(换行), 可以添加换行标签 `<br/>`.

## 引用

引用只需要在被引用的内容段落开头加上右尖括号 `>` 即可. 你可以选择只在开头加一个. 也可以在每行前面都加一个, 效果是一样的.

示例:

``` markdown
> 这一整段的内容都会作为一个HTML的引用元素.
引用元素是会自动优化排版的(reflowable, 可回流).
你可以任意地将引用的内容包含进来, 然后所有这些都会
被解析成为单独一个引用元素. (引用的段落最后空一行结束引用)
```

示例结果:

> 这一整段的内容都会作为一个HTML的引用元素.
> 引用元素是会自动优化排版的(reflowable, 可回流).
> 你可以任意地将引用的内容包含进来, 然后所有这些都会
> 被解析成为单独一个引用元素. (引用的段落最后空一行结束引用)

## 链接

语法:

``` markdown
[链接文字](链接地址)
```

示例:

``` markdown
[Markdown](https://zh.wikipedia.com/wiki/Markdown)
```

示例结果:

[Markdown](https://zh.wikipedia.com/wiki/Markdown)

## 水平分区线

要生成水平分区线, 可以在单独一行里输入3个或以上的短横线、星号或者下划线实现. 短横线和星号之间可以输入任意空格. 以下每一行都产生一条水平分区线.

示例:

``` markdown
* * *
***
*****
- - -
___
```

示例结果:

* * *
***
*****
- - -
___

## 列表

### 无序列表

``` markdown
* Item 1
* Item 2
  * Item 2a
  * Item 2b
```

结果:

* Item 1
* Item 2
  * Item 2a
  * Item 2b

### 有序列表

``` markdown
1. Item 1
2. Item 2
3. Item 3
```

结果:

1. Item 1
2. Item 2
3. Item 3

### 复选框条目(Task Lists)

``` markdown
- [ ] Item 1
- [x] Item 2
- [ ] Item 3
```

结果:

- [ ] Item 1
- [x] Item 2
- [ ] Item 3

## 代码高亮

示例:

![Code Highlighting Sample](/images/markdown_code_demo.png)

示例结果:

``` java
public class Demo {
  public static void main(String[] args) {
    System.out.println("hello world!");
  }
}
```

## 转义

Markdown 中使用反斜杠 \\ 进行转义, 支持转义的符号包括 ``\ ` * _ { } [ ] ( ) # + - . !``, 若要插入空格, 可以使用 `&nbsp;`

示例:

``` markdown
\*literal asterisks\*
```

示例结果(不会被解析成 Markdown):

\*literal asterisks\*

## 表格

示例:

``` markdown
First Header  | Second Header | Third Header
------------- | ------------- | ------------
Content Cell  | Content Cell  | Content Cell
Content Cell  | Content Cell  | Content Cell
```

示例结果:

| First Header | Second Header | Third Header |
| ------------ | ------------- | ------------ |
| Content Cell | Content Cell  | Content Cell |
| Content Cell | Content Cell  | Content Cell |

## Emoji


\:grinning\:
\:smile\:
\:joy\:

示例结果:

:grinning:
:smile:
:joy:

# 编辑工具

* [Typora](https://www.typora.io/)

支持中文, 方便导出成 PDF 文件

* [Visual Studio Code](https://code.visualstudio.com/)

可根据需要安装 Markdown 预览插件

# 参考

1. [https://zh.wikipedia.org/wiki/Markdown](https://zh.wikipedia.org/wiki/Markdown)
2. [https://guides.github.com/features/mastering-markdown/](https://guides.github.com/features/mastering-markdown/)
3. [https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)
