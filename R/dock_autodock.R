# Generated from create-rhello.Rmd: do not edit by hand

#' @title Autodock 分子对接函数
#' @description 这个函数用于进行 Autodock 分子对接分析，调用了 biorange 包的 autodock_run 函数。
#' @param protein_path 蛋白质文件的路径。
#' @param ligand_path 配体文件的路径。
#' @param output_dir 输出文件夹的路径，默认为 "results/dock"。
#' @return 无返回值，但会在指定的目录下生成 Autodock 分子对接的结果。
#' @usage dock_autodock(protein_path, ligand_path, samples_per_complex, output_dir)
#' @examples
#' /dontrun{
#' dock_autodock(
#'   protein_path = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70.pdb",
#'   ligand_path = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70_ligand.sdf"
#' )
#' }
#' @details 这个函数主要用于进行 Autodock 的分子对接分析。
#' @keywords dock, autodock, biorange
#' @export
dock_autodock <- function(
    protein_path,
    ligand_path,
    samples_per_complex = 10L,
    output_dir = "results/dock") {
  biorange <- import_biorange()
  biorange$dock$autodock_run(
    pdb_file_path = protein_path,
    sdf_file_path = ligand_path,
    outdir = output_dir
  )
}