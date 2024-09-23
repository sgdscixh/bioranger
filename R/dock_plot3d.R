# Generated from create-rhello.Rmd: do not edit by hand

#' @title 3D 分子对接可视化函数
#' @description 这个函数用于进行 3D 分子对接可视化，调用了 biorange 包的 plot3d 函数。
#' @param pdb_file PDB 文件的路径。
#' @param sdf_file SDF 文件的路径。
#' @param output_dir 输出文件夹的路径，默认为 "results/dock/"。
#' @param width 输出图像的宽度，默认为 1200。
#' @param height 输出图像的高度，默认为 900。
#' @return 返回一个 3D 视图对象，并在指定的目录下生成一个 HTML 文件。
#' @usage dock_plot3d(pdb_file, sdf_file, output_dir, width, height)
#' @examples
#' dock_plot3d(
#'   pdb_file = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70.pdb",
#'   sdf_file = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70_ligand.sdf"
#' )
#' @details 这个函数主要用于生成 3D 的分子对接可视化图像。
#' @keywords dock, 3d, plot, biorange
#' @export
dock_plot3d <- function(
    pdb_file,
    sdf_file,
    output_dir = "results/dock/",
    width = 1200L,
    height = 900L) {
  # 输入文件检查
  if (!file.exists(pdb_file)) {
    stop(paste("PDB 文件不存在：", normalizePath(pdb_file, mustWork = FALSE)))
  }
  if (!file.exists(sdf_file)) {
    stop(paste("SDF 文件不存在：", normalizePath(sdf_file, mustWork = FALSE)))
  }

  # 参数校验
  if (!is.numeric(width) || width <= 0) {
    stop("参数 'width' 必须是正整数。")
  }
  if (!is.numeric(height) || height <= 0) {
    stop("参数 'height' 必须是正整数。")
  }

  # 确保输出目录存在
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
    message(paste("输出目录不存在，已创建目录：", normalizePath(output_dir)))
  }

  # 构建输出文件路径
  output_file <- file.path(output_dir, "3Dplot.html")

  # 生成 3D 视图
  biorange <- import_biorange()
  view <- biorange$dock$plot3d(
    sdf_file,
    pdb_file,
    as.integer(width),
    as.integer(height)
  )

  # 保存视图为 HTML 文件
  view$write_html(output_file, fullpage = TRUE)

  # 提示输出文件位置
  message(paste("3D 图已保存到：", normalizePath(output_file)))

  # 返回视图对象
  invisible(view)
}
