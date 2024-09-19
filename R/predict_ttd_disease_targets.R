# Generated from create-bioranger.Rmd: do not edit by hand

#' 预测TTD疾病靶点
#'
#' 此函数使用TTD（治疗靶点数据库）预测疾病靶点。
#'
#' @param diseases 一个表示疾病的字符串
#' @return 一个包含预测疾病靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的ttd_disease_target函数对输入的疾病进行靶点预测。
#' 结果会被返回为一个数据框。
#'
#' @examples
#' \dontrun{
#' ttd_targets <- predict_ttd_disease_targets("癌症")
#' print(ttd_targets)
#' }
predict_ttd_disease_targets <- function(diseases) {
  biorange <- import_biorange()
  biorange$target_predict$ttd_disease_target(diseases = diseases)
}
