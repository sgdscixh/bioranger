#' @title PPI基础分析函数生成节点互作表、degree表以及PPI网络图
#' @description 执行蛋白质-蛋白质相互作用(PPI)的基础分析，生成PPI节点文件和degree文件。
#'
#' @param gene_names_file 字符串，Excel文件的路径，包含基因名称列表
#' @param ppi_output_dir 字符串，输出目录的路径，用于保存PPI分析结果
#'
#' @return list，包含PPI分析的结果
#'
#' @details 该函数从Excel文件中读取基因名称，并使用biorange包的ppi模块执行PPI基础分析。
#' 分析结果将保存在指定的输出目录中。
#'
#' @examples
#' gene_names <- readxl::read_excel(gene_names_file)$"Metabolites&disease"
#' ppi_output_dir <- "./results/output/ppi"
#' ppi_results <- ppi_basic_analysis(gene_names_file, ppi_output_dir)
#'
#' @importFrom readxl read_excel
#' @importFrom biorange ppi_basic_analysis
#' @export
ppi_basic_analysis <- function(gene_names, ppi_output_dir) {
    # 执行PPI分析
    biorange <- import_biorange()
    biorange$ppi$ppi_basic_analysis(gene_names, ppi_output_dir)
}
