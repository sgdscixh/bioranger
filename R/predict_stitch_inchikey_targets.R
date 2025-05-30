# Generated from create-bioranger.Rmd: do not edit by hand

#' 使用InChIKeys预测STITCH靶点
#'
#' 此函数对一批InChIKeys进行STITCH靶点预测。
#'
#' @param inchikeys 一个包含InChIKeys的字符向量
#' @return 一个包含预测STITCH靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的stich_inchikey_target函数对InChIKeys进行靶点预测。
#' 结果会被返回为一个数据框。
#'
#' @examples
#' inchikeys <- c("BJYHZSNSMVEQEH-SJORKVTESA-N", "VXIXUWQIVKSKSA-UHFFFAOYSA-N")
#' stitch_inchikey_targets <- predict_stitch_inchikey_targets(inchikeys, combined_score_threshold = 300)
#' print(stitch_inchikey_targets)
predict_stitch_inchikey_targets <- function(inchikeys, combined_score_threshold = 300) { # nolintr
  biorange <- import_biorange()
  biorange$target_predict$stich_inchikey_target(inchikeys = inchikeys, combined_score_threshold = combined_score_threshold)
}
