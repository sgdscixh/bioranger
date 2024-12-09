#' @title 网络圆形布局图绘制函数
#' @description 这个函数用于绘制网络循环图。
#' @param nodes_df 一个数据框，包含节点信息。
#' @param types_df 一个数据框，包含类型信息。
#' @param compound_layers 一个整数向量，指定化合物每层数量
#' @param target_layers 一个整数向量，指定目标每层数量
#' @param output_file 字符串，输出文件的名称。
#' @param output_dir 字符串，输出文件夹的路径。
#' @return 无返回值，但会在指定的目录下生成网络循环图。
#' @usage network_circul_plot(nodes_df, types_df, compound_layers, target_layers, output_file, output_dir)
#' @examples
#' nodes_df <- read.csv("nodes_df_concentric.csv")
#' types_df <- read.csv("type_df_concentric.csv")
#' network_circul_plot(
#'     nodes_df,
#'     types_df,
#'     compound_layers = c(8L),
#'     target_layers = c(10L, 20L, 29L, 38L, 47L),
#'     output_file = "pathway_network_go",
#'     output_dir = "./results/ppi/pathway_network"
#' )
#' @details 这个函数调用了 network_circul_plot 函数来绘制网络循环图。
#' @keywords network, plot, circul
#' @importFrom utils read.csv
#' @export
network_circul_plot <- function(nodes_df, types_df, compound_layers, target_layers, output_file, output_dir) {
    # 导入Python biorange模块
    biorange <- import_biorange()
    result <- biorange$ppi$network_circul_plot(nodes_df, types_df, compound_layers, target_layers, output_file, output_dir)
    return(result)
}
