#' @title 生成靶点类型
#' @description 这个函数接受 富集结果 和靶点数据框，并生成靶点类型。
#' @param kegg_df 富集结果 数据的数据框。
#' @param target_df 靶点数据的数据框。
#' @return 返回一个列表，包含两个数据框：gf1 和 gf2。
#' @examples
#' /dontrun{
#' kegg_df <- read.csv("./kegg_df.csv")
#' target_df <- read.csv("./target_df.csv")
#' 
#' result <- generate_target_types(kegg_df, target_df)
#' node_df <- result[[1]]
#' type_df <- result[[2]]
#' type_counts <- result[[4]]
#' target_num <- type_counts["target"]
#' compound_num <- type_counts["compound"] 
#' }
#' 
#' @export
generate_target_type <- function(kegg_df, target_df) {
  # 假设 biorange 包中有 generate_type 函数
  biorange <- import_biorange()
  result <- biorange$ppi$generate_type(kegg_df, target_df)
  return(result)
}
