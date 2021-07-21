# 合并文件
mkdocscombine -o mydocs.pd

# 处理中间文件
sed -i 's/{: .page-title}//g' mydocs.pd
sed -i 's/title: .*//g' mydocs.pd
sed -i 's/date: .*//g' mydocs.pd

# 生成epub
pandoc --toc -f markdown+grid_tables -t epub -o mydocs.epub mydocs.pd -V mainfont=".PingFang SC"

# 生成pdf, 推荐使用 eisvogel 模板
pandoc "mydocs.pd" -o "mydocs.pdf" --from markdown --template "eisvogel.tex" --listings --latex-engine "xelatex" -V CJKmainfont=".PingFang SC"


# mainfont为操作系统上存在的字体
# pandoc mydocs.pd -o mydocs.pdf --latex-engine=xelatex -V mainfont=".PingFang SC" --template=template.tex

  