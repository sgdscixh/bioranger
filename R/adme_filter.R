#' @title ADMET 过滤
#' @description 这个函数接受化合物数据框，并应用 ADMET 过滤。
#' @param compound_df 包含化合物名称和 InChIKey 的数据框。
#' @param lipinski_threshold 自定义的 Lipinski 阈值。
#' @param qed_threshold 自定义的 QED 阈值。
#' @param bioavailability_threshold 自定义的生物利用度阈值。
#' @return 返回一个数据框，经过 ADMET 过滤后的结果。
#' @examples
#' compound_df <- data.frame(
#'   NameEN = c("beta-Alanine", "Pyrocatechol", "2,3-Dihydroxybenzoic acid (Pyrocatechuic acid)", "Glycine", "Hydroquinone", "Lysine", "Poncirin", "Vanillin", "Xanthine"),
#'   inchikey = c("UCMIRNVEIXFBKS-UHFFFAOYSA-N", "YCIMNLLNPGFGHC-UHFFFAOYSA-N", "GLDQAMYCGOIJDV-UHFFFAOYSA-N", "DHMQDGOQFOQNFH-UHFFFAOYSA-N", "QIGBRXMKCJKVMJ-UHFFFAOYSA-N", "KDXKERNSBIXSRK-YFKPBYRVSA-N", "NLAWPKPYBMEWIR-YZOWQMJMSA-N", "MWOOGOJBHIARFG-UHFFFAOYSA-N", "LRFVTYWOQMYALW-UHFFFAOYSA-N")
#' )
#' result <- admet_filter(compound_df, lipinski_threshold = 4, qed_threshold = 0.5, bioavailability_threshold = 0.3)
#' @export
admet_filter <- function(compound_df, lipinski_threshold = 4, qed_threshold = 0.5, bioavailability_threshold = 0.3) {
  # 导入Python模块
  biorange <- import("biorange")

  # 调用Python函数并传递参数
  result <- biorange$target_predict$data_processing$admet_filter(
    compound_df,
    lipinski_threshold = lipinski_threshold,
    qed_threshold = qed_threshold,
    bioavailability_threshold = bioavailability_threshold
  )

  return(result)
}
