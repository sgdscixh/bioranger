## code to prepare `node_data_339` dataset goes here

node_data_339 <- read.csv("inst/example_data/node_file_339.csv")

usethis::use_data(node_data_339, overwrite = TRUE)
