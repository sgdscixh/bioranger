## code to prepare `gene_list_399` dataset goes here


gene_list_399 <- readLines("inst/example_data/gene_list_399.csv")

usethis::use_data(gene_list_399, overwrite = TRUE)
