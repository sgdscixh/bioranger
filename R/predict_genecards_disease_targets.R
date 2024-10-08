# Generated from create-bioranger.Rmd: do not edit by hand

#' 预测GeneCards疾病靶点
#'
#' 此函数使用GeneCards数据库预测疾病靶点。
#'
#' @param diseases 一个表示疾病查询的字符串
#' @return 一个包含预测疾病靶点的数据框
#' @export
#'
#' @details
#' 该函数使用biorange模块的genecards_disease_target函数
#' 对输入的疾病查询字符串进行靶点预测。
#' 结果会被返回为一个数据框。注意：使用此功能需要自行下载GeneCards数据。
#'
#' @examples
#' \dontrun{
#' genecards_targets <- predict_genecards_disease_targets("癌症")
#' print(genecards_targets)
#' }
predict_genecards_disease_targets <- function(diseases) { # nolintr
  biorange <- import_biorange()
  biorange$target_predict$genecards_disease_target(diseases = diseases)
}
