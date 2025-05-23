#' Identify and Generate Core Targets from PPI Network
#'
#' This function identifies top nodes based on degree centrality in a protein-protein
#' interaction (PPI) network and generates core targets from these nodes.
#'
#' @title PPI核心靶点网络图
#' @description 这个函数将PPI结果按照degree排序筛选靶点，绘制网络图
#' @param degree_target_num Numeric. The target number of top nodes to select based on degree.
#' @param nodes Data frame. Contains node information for the PPI network.
#' @param degree_df Data frame. Contains degree centrality measures for nodes.
#' @param core_output_dir Character. Directory path where output files will be saved.
#'                       Default is "./results/output/pp6".
#' @param file_name_prefix Character. Prefix for output file names.
#'                        Default is "PPI_network_degree_top".
#'
#' @return Results from generate_core_targets function, typically including information
#'         about the core targets identified.
#'
#' @examples
#' \dontrun{
#' kegg_top_nodes <- target_top_nodes(10) # Get top 10 nodes
#' my_nodes <- nodes_df_88
#' my_degree_df <- degree_df_88
#' results <- generate_core_targets(
#'     nodes = my_nodes,
#'     degree_df = my_degree_df,
#'     output_dir = "./my_output",
#'     file_name = "PPI_network_degree_top10",
#'     top_nodes = 100
#' )
#' }
#'
#' @export
ppi_core_targets <- function(nodes, degree_df,
                             output_dir = "./results/output/pp6",
                             file_name = "PPI_network_degree_top", top_nodes = 10) {
    # Determine top nodes based on degree centrality

    biorange <- import_biorange()
    # Generate core targets using the identified top nodes
    biorange$ppi$generate_core_targets(
        nodes = nodes,
        degree_df = degree_df,
        output_dir = output_dir,
        file_name = file_name,
        top_nodes = top_nodes
    )
}
