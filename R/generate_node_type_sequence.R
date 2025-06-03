#' Generate KEGG Pathway Nodes and Type Files
#'
#' This function takes pre-loaded KEGG pathway and target data, then generates
#' node files, type files, node counts, and target sequences for downstream analysis.
#'
#' 
#' @title generate_node_type_sequence
#' @description 该函数根据KEGG数据、代谢物列表和节点度信息表，创建汇通路-靶点-成分的节点映射和类型数据框，并返回靶点和成分计数以及用于绘图的靶点的序列。
#' @param kegg_df Data frame. KEGG pathway data (already loaded).
#' @param targets_total_df Data frame. Metabolite targets data (already loaded).
#' @param nodes Data frame. PPI network nodes data.
#' @param degree_df Data frame. Node degree information.
#' @param target_top_n Numeric. Number of top targets to select. Default is 50.
#' @param compound_top_n Numeric. Number of top compounds to select. Default is 10.
#'
#' @return A list containing:
#' \itemize{
#'   \item{kegg_node_file}{Generated node file}
#'   \item{kegg_type_file}{Generated type file}
#'   \item{kegg_node_counts}{Node counts data}
#'   \item{kegg_target_sequence}{Target sequence information}
#' }
#'
#' @examples
#' \dontrun{
#' # 读取数据
#' kegg_data <- readxl::read_excel("/path/to/kegg_res_2.xlsx") |> head(10)
#' targets_data <- readxl::read_excel("/path/to/metabolite_total_targets_2.xlsx")
#'
#' # 调用函数
#' results <-generate_node_type_sequence(
#'     kegg_df = kegg_data,
#'     targets_total_df = targets_data,
#'     nodes = ppi_network$nodes,
#'     degree_df = ppi_network$degree_df
#'     target_top_n = 50L,
#'     compound_top_n = 10L
#' 
#' )
#' }
#'
#' @export
generate_node_type_sequence <- function(pathway_df,
                                        targets_total_df,
                                        nodes_df,
                                        degree_df,
                                        target_top_n = 50L,
                                        compound_top_n = 10L) {
    biorange <- import_biorange()
    # 生成节点和类型文件
    result_list <- biorange$ppi$generate_node_type_sequence(
        pathway_df = pathway_df,
        targets_total_df = targets_total_df,
        nodes_df= nodes_df,
        degree_df = degree_df,
        target_top_n = target_top_n,
        compound_top_n = compound_top_n
    )

    # 返回结果列表
    list(
        node_file = result_list[[1]],
        type_file = result_list[[2]],
        target_compound_counts = result_list[[3]],
        target_sequence = result_list[[4]],
        compound_id = result_list[[5]]

    )
}
