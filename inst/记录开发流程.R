usethis::use_vignette("networkpharam-analysis-use-python")

usethis::use_data_raw(name = "gene_list_399") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_data_raw(name = "node_data_339") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_data_raw(name = "type_data_146") # 将 "my_dataset" 替换为您的数据集名称

usethis::use_r(name = "enrich_barplot")
usethis::use_r(name = "enrich_dotplot")

devtools::document()
devtools::load_all()

# 构建 vignette（在添加内容后）
devtools::build_vignettes()
pkgdown::build_site()
