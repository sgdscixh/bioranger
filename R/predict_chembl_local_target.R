#' 获取化合物的靶标信息
#'
#' 此函数根据提供的化合物InChIKey从ChEMBL数据库检索靶标信息。
#' 可按生物体和置信水平过滤结果。
#'
#' @param compound_input 一个包含命名列表的列表，每个列表应包含InChIKey字符串。
#' 每个列表应包括一个`inchikey`元素。
#' @param organism 一个字符串，指定要过滤结果的生物体。默认为"Homo sapiens"。
#' @param confidence_column 一个字符串，指示置信评分的列名。默认为"confidence80"。
#' @param confidence_types 一个字符向量，指定要包含的置信类型。
#' 默认为c("active", "both")。
#' @param threshold 一个整数阈值，用于过滤结果。默认为6。
#'
#' @return 返回一个包含与提供的化合物相关的靶标信息的数据框。
#'
#' @examples
#' compound_input <- c("UCMIRNVEIXFBKS-UHFFFAOYSA-N", "YCIMNLLNPGFGHC-UHFFFAOYSA-N")
#' result <- chembl_inchikey_target(compound_input)
#' print(result)
#'
#' @export
chembl_inchikey_target <- function(compound_input, organism = "Homo sapiens",
                                   confidence_column = "confidence80",
                                   confidence_types = c("active", "both"),
                                   threshold = 6) {
  # 导入Python模块
  biorange <- import_biorange()

  # 调用Python函数
  result <- biorange$target_predict$chembl_inchikey_target(compound_input, organism, confidence_column, confidence_types, threshold)

  # 将结果转换为R的数据框（假设Python返回的是Pandas DataFrame）
  return(result)
}
