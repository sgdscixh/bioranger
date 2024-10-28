# Generated from create-rhello.Rmd: do not edit by hand

#' @title 圆形网络绘图函数
#' @description 这个函数用于进行圆形布局的网络绘图，调用了 biorange 包的 plot_network_circle 函数。
#' @param nodes_df 一个包含节点信息的数据框。
#' @param types_df 一个包含类型信息的数据框。
#' @param target_layers 一个包含目标层级的向量，可以为 NULL。
#' @param layer_radii 一个包含层级半径的向量，可以为 NULL。
#' @param output_file 输出文件的名称，默认为 "circle_layout"。
#' @param output_dir 输出文件夹的路径，默认为 "./results/ppi/circle_layout"。
#' @param figsize 输出图像的尺寸，默认为 c(12, 12)。
#' @param dpi 输出图像的分辨率，默认为 900。
#' @return 无返回值，但会在指定的目录下生成圆形布局的网络图像。
#' @usage plot_network_circle(nodes_df, types_df, target_layers, layer_radii, output_file, output_dir, figsize, dpi)
#' @examples
#' plot_network_circle(
#'   nodes_df = node_data_339,
#'   types_df = type_data_146,
#'   target_layers = c(15L, 23L, 35L, 57L),
#'   layer_radii = c(0.13, 0.35, 0.48, 0.63, 0.78, 1.3),
#'   output_file = "circle_layout",
#'   output_dir = "./results/ppi/circle_layout",
#'   figsize = c(12, 12),
#'   dpi = 900
#' )
#' @details 这个函数主要用于根据用户指定的布局参数来生成圆形布局的网络图像。
#' @keywords network, plot, circle, biorange
#' @export
plot_network_circle <- function(
    nodes_df,
    types_df,
    target_layers = NULL,
    layer_radii = NULL,
    output_file = "circle_layout",
    output_dir = "./results/ppi/circle_layout",
    figsize = c(12, 12),
    dpi = 900) {
  # 假设biorange包中有一个plot_network_circle函数
  biorange <- import_biorange()
  biorange$ppi$plot_network_circle(
    nodes_df = nodes_df,
    types_df = types_df,
    target_layers = as.integer(target_layers),
    layer_radii = layer_radii,
    output_file = output_file,
    output_dir = output_dir,
    figsize = figsize,
    dpi = dpi
  )
}
