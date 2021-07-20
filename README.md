# PDSP

#### 介绍
《Personal Development for Smart People》的中文自译版

#### 序言
这里是《Personal Development for Smart People》的中文翻译版，全程由个人完成。

该项目已经部署到 pages 服务上了，欢迎大家访问项目 **[pages](https://wtsnwei.github.io/pdsp/)**

我只是一名读书爱好者，看到这本书后，大感没有中文翻译版，遗憾不已！所以决定自己完成该书的翻译过程，希望给那些还在迷茫的人一个指引，也对自己是一个磨砺！

水平有限，只能勉强做到语义通顺（其实有些地方还没做到），欢迎在该项目的 issue 上提出建议！

#### 依赖

如果需要生成epub和pdf离线文件，还需要其他依赖，详细说明见 [requirements](requirements)。

* mkdocscombine
* pandoc=1.19.2.1
* texlive或其他 xelatex 引擎
* 萍方字体（美化字体，不要也可以）

#### 生成 epub

感谢**[@heyeshuang](https://github.com/heyeshuang)** 提供的建议，这里使用 mkdocscombine、pandoc 来生成 epub。

```bash
# 合并文件
mkdocscombine -o mydocs.pd

# 处理中间文件
sed -i 's/{: .page-title}//g' mydocs.pd

# 生成epub
pandoc --toc -f markdown+grid_tables -t epub -o mydocs.epub mydocs.pd -V mainfont=".PingFang SC"

```



#### 生成 pdf

为了处理中文，还需要使用 xelatex 编译引擎。

```bash
# 合并文件
mkdocscombine -o mydocs.pd

# 处理中间文件
sed -i 's/{: .page-title}//g' mydocs.pd

# 生成pdf
pandoc mydocs.pd -o mydocs.pdf --latex-engine=xelatex -V mainfont=".PingFang SC" --template=template.tex
```



#### 贡献

* 感谢 **[@heyeshuang](https://github.com/heyeshuang)** 提供生成的 epub 文件，有需要的小伙伴可以到[这里](https://github.com/wtsnwei/pdsp/issues/2)下载

