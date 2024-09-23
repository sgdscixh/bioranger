# Generated from create-rhello.Rmd: do not edit by hand

#' @title PPI 分析函数
#' @description 这个函数用于进行蛋白质-蛋白质相互作用 (PPI) 分析。
#' @param gene_names 一个包含基因名称的向量。
#' @param output_dir 输出文件夹的路径。
#' @return 无返回值，但会在指定的目录下生成 PPI 分析结果。
#' @usage ppi_analysis(gene_names, output_dir)
#' @examples
#' gene_list <- gene_list_399
#' output_dir <- "./results/ppi"
#' ppi_analysis(gene_list, output_dir)
#' @details 这个函数调用了 biorange 包的 ppi_analysis 函数来进行 PPI 分析。
#' @keywords ppi, analysis, biorange
#' @importFrom fs dir_create
#' @export
ppi_analysis <- function(gene_names, output_dir) {
  # 假设biorange包中有一个ppi_analysis函数
  fs::dir_create(output_dir)
  biorange <- import_biorange()
  biorange$ppi$ppi_analysis(
    gene_names,
    output_dir
  )
}
