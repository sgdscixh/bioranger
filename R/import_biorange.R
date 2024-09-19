# Generated from create-bioranger.Rmd: do not edit by hand

#' 导入Python biorange模块
#'
#' 此函数尝试使用reticulate包导入Python的biorange模块。
#' 
#' @return 导入的biorange模块
#' @export
#' @importFrom reticulate import
#'
#' @details
#' 该函数使用reticulate包的import函数来加载Python的biorange模块。
#' 如果导入失败，函数将抛出一个错误，提示用户确保正确安装了biorange模块。
#'
#' @examples
#' \dontrun{
#' biorange <- import_biorange()
#' }
import_biorange <- function() {
  tryCatch({
    reticulate::import("biorange", convert = TRUE)
  }, error = function(e) {
    stop("无法加载Python模块'biorange'。请确保它已正确安装。")
  })
}
