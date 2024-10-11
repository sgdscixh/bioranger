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


devtools::document()
devtools::load_all()

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

# 构建 vignette（在添加内容后）
devtools::build_vignettes()
# usethis::use_pkgdown()
pkgdown::build_site(lazy = TRUE)

# 打包R包
devtools::build(pkg = ".", binary = FALSE, manual = FALSE, vignettes = FALSE)
