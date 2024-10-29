# Generated from create-rhello.Rmd: do not edit by hand

#' @title Smina 结合能评分函数
#' @description 这个函数用于计算 Smina 结合能评分，调用了 biorange 包的 smina_score 函数。
#' @param receptor_file 受体文件的路径。
#' @param ligand_file 配体文件的路径。
#' @return 返回一个包含 Smina 结合能评分的数据框。
#' @usage dock_smina_score(receptor_file, ligand_file)
#' @examples
#' dock_smina_score(
#'   receptor_file = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70.pdb",
#'   ligand_file = "/home/liuyan/projects/package/bioranger/inst/example_data/6w70_ligand.sdf"
#' )
#' @details 这个函数主要用于计算 Smina 的结合能评分。
#' @keywords dock, smina, score, biorange
#' @export
dock_smina_score <- function(
    receptor_file,
    ligand_file) {
  biorange <- reticulate::import("biorange")
  biorange$dock$smina_score(
    receptor_file = receptor_file,
    ligand_file = ligand_file
  )
}
