# Generated from create-bioranger.Rmd: do not edit by hand

#' 使用InChIKeys预测TCMSP靶点
#'
#' 此函数对一批InChIKeys进行TCMSP靶点预测。
#'
#' @param inchikeys 一个包含InChIKeys的字符向量
#' @return 一个包含预测TCMSP靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的tcmsp_inchikey_target函数对输入的InChIKeys进行靶点预测。
#' 结果会被返回为一个数据框。
#'
#' @examples
#' \dontrun{
#' inchikeys <- c("BSYNRYMUTXBXSQ-UHFFFAOYSA-N", "LFQSCWFLJHTTHZ-UHFFFAOYSA-N")
#' tcmsp_inchikey_targets <- predict_tcmsp_inchikey_targets(inchikeys)
#' print(tcmsp_inchikey_targets)
#' }
predict_tcmsp_inchikey_targets <- function(inchikeys) {
  biorange <- import_biorange()
  biorange$target_predict$tcmsp_inchikey_target(inchikeys = inchikeys)
}
