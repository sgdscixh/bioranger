# Generated from create-rhello.Rmd: do not edit by hand

#' @title 自定义网络绘图函数
#' @description 这个函数用于进行自定义布局的网络绘图，调用了 biorange 包的 plot_network_custom 函数。
#' @param nodes_df 一个包含节点信息的数据框。
#' @param types_df 一个包含类型信息的数据框。
#' @param num_rows 网格布局的行数，默认为 7。
#' @param num_cols 网格布局的列数，默认为 12。
#' @param output_file 输出文件的名称，默认为 "custom_layout"。
#' @param output_dir 输出文件夹的路径，默认为 "./results/ppi/custom_layout"。
#' @param figsize 输出图像的尺寸，默认为 c(14, 10)。
#' @return 无返回值，但会在指定的目录下生成自定义布局的网络图像。
#' @usage plot_network_custom(nodes_df, types_df, num_rows, num_cols, output_file, output_dir, figsize)
#' @examples
#' plot_network_custom(
#'   node_data_339,
#'   type_data_146,
#'   num_rows = 7,
#'   num_cols = 12,
#'   output_file = "custom_layout",
#'   output_dir = "./results/ppi/custom_layout",
#'   figsize = c(14, 10)
#' )
#' @details 这个函数主要用于根据用户指定的布局参数来生成网络图像。
#' @keywords network, plot, custom, biorange

#' @export
plot_network_custom <- function(
    nodes_df, types_df,
    num_rows = 7,
    num_cols = 12,
    output_file = "custom_layout",
    output_dir = "./results/ppi/custom_layout",
    figsize = c(14, 10)) {
  biorange <- import_biorange()
  biorange$ppi$plot_network_custom(
    nodes_df = nodes_df,
    types_df = types_df,
    num_rows = num_rows,
    num_cols = num_cols,
    output_file = output_file,
    output_dir = output_dir,
    figsize = figsize
  )
}
