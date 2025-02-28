#' 此函数使用 biorange 模块中的 html_png_onestep 函数将 HTML 文件转换为 PNG 格式。
#'
#' @param file_path 需要转换的 HTML 文件路径。
#' @param output_path 转换后的 PNG 文件输出路径。
#' @param wait_time 页面等待时间，默认为 15。
#' @param is_remote 是否远程，默认为 FALSE。
#' @return 无返回值，直接生成 PNG 文件。
#' @export
#'
#' @details
#' 该函数调用 biorange 模块中的 html_png_onestep 函数，
#' 使用提供的文件路径和输出路径进行转换。
#'
#' @examples
#' \dontrun{
#' html_to_png_onestep(
#'     "/home/liuyan/projects/package/biorang_bak/2d_autodock.html",
#'     "/home/liuyan/projects/package/biorang_bak/999doutput.png",
#'     wait_time = 15,
#'     is_remote = FALSE
#' )
#' }
html_to_png_onestep <- function(file_path, output_path, wait_time = 15, is_remote = FALSE) {
    biorange <- import_biorange()
    biorange$dock$dock_png_onestep$html_png_onestep(
        file_path,
        output_path,
        wait_time = wait_time,
        is_remote = is_remote
    )
}
