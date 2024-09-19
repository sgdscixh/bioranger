# Generated from create-bioranger.Rmd: do not edit by hand

#' 批量预测TCMSP靶点
#'
#' 此函数对一批SMILES字符串进行TCMSP靶点预测。
#'
#' @param smiles 一个包含SMILES字符串的字符向量
#' @return 一个包含预测TCMSP靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的tcmsp_smiles_target函数对每个输入的SMILES字符串进行靶点预测。
#' 结果会被合并成一个数据框返回。
#'
#' @examples
#' \dontrun{
#' smiles <- c("CC(=O)OC1=CC=CC=C1C(=O)O", "CCO")
#' tcmsp_targets <- predict_tcmsp_batch_targets(smiles)
#' print(tcmsp_targets)
#' }
predict_tcmsp_batch_targets <- function(smiles) {
  biorange <- import_biorange()
  do.call(rbind, lapply(smiles, function(smile) {
    biorange$target_predict$tcmsp_smiles_target(smile)
  }))
}
