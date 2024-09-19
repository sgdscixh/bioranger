# Generated from create-bioranger.Rmd: do not edit by hand

#' 批量预测ChEMBL靶点
#'
#' 此函数对一批SMILES字符串进行ChEMBL靶点预测。
#'
#' @param smiles 一个包含SMILES字符串的字符向量
#' @return 一个包含预测ChEMBL靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的chembl_smiles_target函数对每个输入的SMILES字符串进行靶点预测。
#' 结果会被合并成一个数据框返回。
#'
#' @examples
#' \dontrun{
#' smiles <- c("CC(=O)OC1=CC=CC=C1C(=O)O", "CCO")
#' chembl_targets <- predict_chembl_batch_targets(smiles)
#' print(chembl_targets)
#' }
predict_chembl_batch_targets <- function(smiles) {
  biorange <- import_biorange()
  do.call(rbind, lapply(smiles, function(smile) {
    biorange$target_predict$chembl_smiles_target(smile)
  }))
}
