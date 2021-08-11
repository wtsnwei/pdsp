# 合并文件
mkdocscombine -o pdsp.pd

# 处理中间文件
sed -i 's/{: .page-title}//g' pdsp.pd

# 生成epub
pandoc --toc -f markdown+grid_tables -t epub -o pdsp.epub pdsp.pd

# 生成pdf, 推荐使用 eisvogel 模板
pandoc "pdsp.pd" -o "pdsp.pdf" --from markdown --template "eisvogel.tex" --listings --latex-engine "xelatex" -V CJKmainfont=".PingFang SC"


# mainfont为操作系统上存在的字体
# pandoc pdsp.pd -o pdsp.pdf --latex-engine=xelatex -V CJKmainfont=".PingFang SC" --template=template.tex

# 删除生成的中间文件
rm *.pd