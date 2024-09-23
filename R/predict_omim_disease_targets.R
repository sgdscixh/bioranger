# Generated from create-bioranger.Rmd: do not edit by hand

#' 预测OMIM疾病靶点
#'
#' 此函数使用OMIM数据库预测疾病靶点。
#'
#' @param diseases 一个表示疾病表型的字符串
#' @return 一个包含预测疾病靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的omim_disease_target函数对输入的疾病表型进行靶点预测。
#' 结果会被返回为一个数据框。
#'
#' @examples
#' \dontrun{
#' omim_targets <- predict_omim_disease_targets("癌症")
#' print(omim_targets)
#' }
predict_omim_disease_targets <- function(diseases) {
  biorange <- import_biorange()
  biorange$target_predict$omim_disease_target(diseases = diseases)
}
