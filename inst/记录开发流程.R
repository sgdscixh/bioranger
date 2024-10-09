usethis::use_vignette("networkpharam-analysis-use-python")

usethis::use_data_raw(name = "gene_list_399") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_data_raw(name = "node_data_339") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_data_raw(name = "type_data_146") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_r(name = "enrich_barplot")
usethis::use_r(name = "enrich_dotplot")
usethis::use_r(name = "datasets")

devtools::document()
devtools::load_all()

usethis::use_vignette("networkpharam-analysis-use-R")


## 结束啦，一会生成网页看看效果
## 先检查包的完整性

# 代码风格格式化（遵循 tidyverse 风格指南）
styler::style_pkg()
# 代码风格检查，查找不符合风格指南的代码
lintr::lint_package()
devtools::check()

# 构建 vignette（在添加内容后）
devtools::build_vignettes()
# usethis::use_pkgdown()
pkgdown::build_site(lazy = TRUE)

# 打包R包
devtools::build(pkg = ".", binary = FALSE, manual = FALSE, vignettes = FALSE)
