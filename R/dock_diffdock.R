# Generated from create-rhello.Rmd: do not edit by hand

#' @title Diffdock 分子对接函数
#' @description 这个函数用于进行 Diffdock 分子对接分析，调用了 biorange 包的 diffdock_run 函数。
#' @param protein_path 蛋白质文件的路径。
#' @param ligand_path 配体文件的路径。
#' @param samples_per_complex 每个复合物的样本数量，默认为 10。
#' @param output_dir 输出文件夹的路径，默认为 "results/dock"。
#' @return 无返回值，但会在指定的目录下生成 Diffdock 分子对接的结果。
#' @usage dock_diffdock(protein_path, ligand_path, samples_per_complex, output_dir)
#' @examples
#' dock_diffdock(
#'   protein_path = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70.pdb",
#'   ligand_path = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70_ligand.sdf"
#' )
#' @details 这个函数主要用于进行 Diffdock 的分子对接分析。
#' @keywords dock, diffdock, biorange
#' @export
dock_diffdock <- function(
    protein_path,
    ligand_path,
    samples_per_complex = 10L,
    output_dir = "results/dock") {
  biorange <- import_biorange()
  biorange$dock$diffdock_run(
    protein_path,
    ligand_path,
    samples_per_complex,
    output_dir
  )
}
