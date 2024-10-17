#' @title ADMET 过滤
#' @description 这个函数接受化合物数据框，并应用 ADMET 过滤。
#' @param compound_df 包含化合物名称和 InChIKey 的数据框。
#' @return 返回一个数据框，经过 ADMET 过滤后的结果。
#' @examples
#' compound_df <- data.frame(
#'   NameEN = c("beta-Alanine", "Pyrocatechol", "2,3-Dihydroxybenzoic acid (Pyrocatechuic acid)", "Glycine", "Hydroquinone", "Lysine", "Poncirin", "Vanillin", "Xanthine"),
#'   inchikey = c("UCMIRNVEIXFBKS-UHFFFAOYSA-N", "YCIMNLLNPGFGHC-UHFFFAOYSA-N", "GLDQAMYCGOIJDV-UHFFFAOYSA-N", "DHMQDGOQFOQNFH-UHFFFAOYSA-N", "QIGBRXMKCJKVMJ-UHFFFAOYSA-N", "KDXKERNSBIXSRK-YFKPBYRVSA-N", "NLAWPKPYBMEWIR-YZOWQMJMSA-N", "MWOOGOJBHIARFG-UHFFFAOYSA-N", "LRFVTYWOQMYALW-UHFFFAOYSA-N")
#' )
#' result <- admet_filter(compound_df)
#' @export
admet_filter <- function(compound_df) {
  # 假设 biorange 包中有 admet_filter 函数
  biorange <- import_biorange()
  result <- biorange$target_predict$admet_filter(compound_df)

  return(result)
}
