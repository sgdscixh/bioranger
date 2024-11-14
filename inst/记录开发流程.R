usethis::use_vignette("networkpharam-analysis-use-python")

usethis::use_data_raw(name = "gene_list_399") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_data_raw(name = "node_data_339") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_data_raw(name = "type_data_146") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_r(name = "enrich_barplot")
usethis::use_r(name = "enrich_dotplot")
usethis::use_r(name = "datasets")
usethis::use_r(name = "ppi_generate_type")
usethis::use_r(name = "adme_filter")
usethis::use_r(name = "dock_autodock")
usethis::use_r(name = "predict_chembl_local_target")
usethis::use_r(name = "dockplot_2d")
usethis::use_r(name = "dockplot_3d")
usethis::use_r(name = "dock_split")
usethis::use_r(name = "dock_clean")


devtools::document() # 新增说明书
devtools::load_all() # 加载所有函数进来，用作测试。别忘了 我们还没有安装新的conda，在这个测试的环境

usethis::use_vignette("networkpharam-analysis-use-R")

usethis::use_version()
# 创建 NEWS.md 文件，用于记录每次版本更新的变更
usethis::use_news_md()

## 先检查包的完整性

# 代码风格格式化（遵循 tidyverse 风格指南）
styler::style_pkg()
# 代码风格检查，查找不符合风格指南的代码
lintr::lint_package()
devtools::check()

# 构建 vignette长文档，用于展示包的功能和用法（在添加内容后）
devtools::build_vignettes()
# usethis::use_pkgdown()
# 构建静态网站文档，lazy = TRUE 表示重新构建已改变的文档
pkgdown::build_site(lazy = TRUE)

# 打包R包
devtools::build(pkg = ".", binary = FALSE, manual = FALSE, vignettes = FALSE)

# 使用R安装python包，到R交互的python虚拟环境

# 注意vscode自动打开的 R terminal 是radian，他是用python模拟R终端，再在里面用R模拟python的话 就套娃了，不被允许会报堆栈错误
# 我设置的默认自动打开radian，按ctrl + enter 运行R会自动打开radian
# 所以需要用Rstudio打开R终端，或者直接命令行输出R打开丑八怪的R终端

# 1.强制指定虚拟环境，参考之前的教程

# 2.查看虚拟环境
reticulate::py_config() # 查看使用的是什么虚拟环境

# 3.手动安装python包，记得使用ignore_installed = TRUE才会强制升级，相当于pip install xxx --upgrade
reticulate::py_install("/home/liuyan/projects/package/biorang_bak/dist/biorange-1.4.3-py3-none-any.whl", ignore_installed = TRUE)
# 手动安装 pip install "/home/liuyan/projects/package/biorang_bak/dist/biorange-1.4.3-py3-none-any.whl"
# z这里
reticulate::use_condaenv("r-baby", required = TRUE)

reticulate::py_config()


# 更新R包及上传到github
# 1. 更新后将改动或新增文件提交到git，控制版本
# 2. 如有新增R函数模块，需运行devtools::document()新增对应说明书
# 3. 运行 devtools::build() 构建R包
# 4. 运行 export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890 更改代理
# 5. 运行git push 将包上传到git hub
#
